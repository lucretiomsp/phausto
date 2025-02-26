"
Simple sawtooth waveform oscillator between -1 and 1.

## Parameters:

- **freq: frequency in Hz
"
Class {
	#name : 'LFOSaw',
	#superclass : 'LFO',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
LFOSaw >> initialize [

	super initialize.
	processExpression := 'process = os.lf_sawpos;'
]
