"
Turns a signal into an impulse with the value of the current sample (0.3,0.2,0.1 becomes 0.3,0.0,0.0). This function is typically used with a button to turn its output into an impulse. impulsify is a standard Faust function.
"
Class {
	#name : 'Impulsify',
	#superclass : 'UnitGenerator',
	#instVars : [
		'gate'
	],
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
Impulsify >> asBox [

	| intermediateBox finalBox gateBox |
	self initializeUIParameters.
	intermediateBox := super asBox.
	gateBox := gate asBox.
	finalBox := gateBox connectTo: intermediateBox.
	^ finalBox * uLevel
]

{ #category : 'accessing' }
Impulsify >> gate [

	^ gate
]

{ #category : 'accessing' }
Impulsify >> gate: anObject [

	gate := anObject
]

{ #category : 'initialization' }
Impulsify >> initialize [

	super initialize.
	processExpression := 'process = ba.impulsify;'
]

{ #category : 'initialization' }
Impulsify >> initializeGateAsButton [

gate := PhButton new label: self label
]

{ #category : 'initialization' }
Impulsify >> initializeUIParameters [

	super initializeUIParameters.
	"default frequency for all Oscilators is A4 at picth standard - maxValue corresponds to a C8 note"

	"the UI element to control the freq is created only if the parameter is nil at instance creation"
	gate ifNil: [self initializeGateAsButton  ]
]
