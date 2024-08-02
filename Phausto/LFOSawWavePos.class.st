"
Simple sawtooth waveform oscillator between 0 and 1.
"
Class {
	#name : #LFOSawWavePos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LFOSawWavePos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_sawpos;'
]
