"
Alias-suppressed sawtooth oscillator, sawtooth is a standard Faust function.

## Parameters:

freq: frequency in Hz
"
Class {
	#name : #SawOsc,
	#superclass : #Oscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
SawOsc >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox .
	finalBox := freq asBox connectTo: intermediateBox .
^ finalBox
]

{ #category : #initialization }
SawOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
