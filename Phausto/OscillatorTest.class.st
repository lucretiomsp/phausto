Class {
	#name : 'OscillatorTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
OscillatorTest >> testCosWaveformAsDsp [

	self deny: CosWaveform new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testPhasorAsDsp [

	self deny: Phasor new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testPulseOscAsDsp [

	self deny: PulseOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testSinWaveformAsDsp [

self deny: SinWaveform new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testSinWaveformChangeWtSizeDsp [


| osc |
osc := SinWaveform new tableSize: 512.
	self deny: osc  stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testSineOscAsDsp [

	self deny: SineOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testSquareOscAsDsp [

	self deny: SquareOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorTest >> testTriOscAsDsp [

	self deny: TriOsc new stereo asDsp isNull
]
