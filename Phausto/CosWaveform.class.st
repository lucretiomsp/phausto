"
Cosine waveform ready to use with a rdtable.

##Parameters:

**tablesize:** the table size
"
Class {
	#name : 'CosWaveform',
	#superclass : 'WaveTableBasedOscillators',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
CosWaveform >> asBox [ 

^ super asBox 
]

{ #category : 'converting' }
CosWaveform >> initialize [

	super initialize.
	processExpression := 'process =os.coswaveform(1024);'
]
