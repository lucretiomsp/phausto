"
Default Sine wave oscillator, corresponding to Faust osc standard function
## Parameters:

freq: frequency in Hz
"
Class {
	#name : #SineOsc,
	#superclass : #Oscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
SineOsc >> asBox [

	| intermediateBox finalBox freqBox |
	intermediateBox := super asBox.
	freqBox := freq asBox.
	finalBox := freqBox  connectTo: intermediateBox.
	^ finalBox * uLevel
]

{ #category : #initialization }
SineOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.osc;'
]
