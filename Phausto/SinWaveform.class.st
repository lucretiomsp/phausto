"
Sine waveform ready to use with a rdtable.

##Parameters:

**tablesize:** the table size
"
Class {
	#name : 'SinWaveform',
	#superclass : 'WaveTableBsedOscillators',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
SinWaveform >> asBox [

	^ super asBox
]

{ #category : 'initialization' }
SinWaveform >> initialize [

	super initialize.
	processExpression := 'process = os.sinwaveform(1024);'
]
