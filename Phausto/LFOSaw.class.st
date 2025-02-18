"
Simple sawtooth waveform oscillator between -1 and 1.

## Parameters:

- **freq: frequency in Hz
"
Class {
	#name : 'LFOSaw',
	#superclass : 'LFO',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSaw >> initialize [

	super initialize.
	processExpression := 'process = os.lf_sawpos;'
]
