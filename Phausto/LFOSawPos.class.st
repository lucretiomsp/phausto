"
Simple sawtooth waveform oscillator between 0 and 1.

## Parameters
- **freq**: set the frequency of the Oscillator
- **amount**: set the multiplier for the Oscillator output 
- **offset**: an offset for the LFO output. 

"
Class {
	#name : 'LFOSawPos',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSawPos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_sawpos;'
]
