Class {
	#name : 'OscillatorTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
OscillatorTest >> testSinWaveformAsDsp [

self deny: SinWaveform new stereo asDsp isNull
]
