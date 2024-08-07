"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
## Parameters:

freq: frequency in Hz
"
Class {
	#name : #SquareOsc,
	#superclass : #Oscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
SquareOsc >> asBox [

	| intermediateBox finalBox |
	self initializeUIParameters.
	intermediateBox := super asBox.
	finalBox := freq connectTo: intermediateBox.
	^ finalBox * uLevel
]

{ #category : #initialization }
SquareOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.square;'
]
