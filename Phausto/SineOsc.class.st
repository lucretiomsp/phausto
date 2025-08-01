"
Default Sine wave oscillator, corresponding to Faust osc standard function

## Parameters:

- **freq**: frequency in Hz
"
Class {
	#name : 'SineOsc',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
SineOsc >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox connectTo: intermediateBox.
	^ finalBox * self uLevel asBox
]

{ #category : 'initialization' }
SineOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.osc;'
]
