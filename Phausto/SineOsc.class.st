"
Default Sine Wave-Table-Based Oscillator

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
SineOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.osc;'
]
