"
Default Sine wave oscillator, corresponding to Faust osc standard function
## Parameters:

freq: frequency in Hz
"
Class {
	#name : 'SineOsc',
	#superclass : 'Oscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
SineOsc >> asBox [

	| intermediateBox finalBox  |
	intermediateBox := super asBox.
	finalBox := self freq connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'initialization' }
SineOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.osc;'
]
