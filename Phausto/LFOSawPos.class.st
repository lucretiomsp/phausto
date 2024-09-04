"
Simple sawtooth waveform oscillator between 0 and 1.
"
Class {
	#name : 'LFOSawPos',
	#superclass : 'LowFrequencyOscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSawPos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_sawpos;'
]
