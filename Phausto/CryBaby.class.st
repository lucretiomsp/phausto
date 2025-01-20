"
Digitized CryBaby wah pedal.

Parameter:
wah: ""pedal angle"" from 0 to 1

more info: 
https://ccrma.stanford.edu/~jos/pasp/vegf.html
"
Class {
	#name : 'CryBaby',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input',
		'fr',
		'wah'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
CryBaby >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input , self wah connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
CryBaby >> initialize [

	super initialize.
	processExpression := 'process = ve.crybaby;'
]

{ #category : 'accessing' }
CryBaby >> input [

	^ input ifNil: [ input := 0 asBox ]
]

{ #category : 'as yet unclassified' }
CryBaby >> patchedWith: aBox [
self input: aBox
]

{ #category : 'as yet unclassified' }
CryBaby >> wah [

	^ wah ifNil: [
		  wah := PhHSlider new
			        label: self class name , 'Wah'
			        init: 0.5
			        min: 0
			        max: 1
			        step: 0.001 ]
]
