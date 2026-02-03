"
Alias-suppressed sawtooth oscillator, sawtooth is a standard Faust function.

## Parameters:

- **freq**: frequency in Hz
"
Class {
	#name : 'SawOsc',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
SawOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
