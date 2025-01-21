"
Wah effect, 4th order

Parameter: fr: resonance frequency in Hz

more info : 
https://ccrma.stanford.edu/~jos/pasp/vegf.html
"
Class {
	#name : 'Wah',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input',
		'fr'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Wah >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self fr , self input  connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
Wah >> fr [

^ fr ifNil: [  fr := PhHSlider new label: self class name , 'Fr' init: 400 min: 20 max: 9000 step: 1 ]
]

{ #category : 'initialization' }
Wah >> initialize [

	super initialize.
	processExpression := 'process = ve.wah4;'.

]

{ #category : 'accessing' }
Wah >> input [

	^ input ifNil: [ input := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Wah >> patchedWith: aBox [
self input: aBox
]
