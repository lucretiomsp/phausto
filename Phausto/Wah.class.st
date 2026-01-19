"
Wah effect, 4th order

Parameter: fr: resonance frequency in Hz

more info : 
https://ccrma.stanford.edu/~jos/pasp/vegf.html
"
Class {
	#name : 'Wah',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'level',
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
	finalBox := self fr asBox, self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
Wah >> fr [

	^ fr
]

{ #category : 'initialization' }
Wah >> initialize [

	super initialize.
	processExpression := 'process = ve.wah4;'.
	fr := PhHSlider new
				        label: self class name , 'Fr'
				        init: 400
				        min: 20
				        max: 9000
				        step: 1
]
