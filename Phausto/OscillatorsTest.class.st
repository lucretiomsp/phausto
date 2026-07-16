Class {
	#name : 'OscillatorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
OscillatorsTest >> testCZhalfSineAsDsp [

	self assert: CZhalfSine new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZhalfSinePAsDsp [

	self assert: CZhalfSineP new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZpulseAsDsp [

	self assert: CZpulse new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZpulsePAsDsp [

	self assert: CZpulseP new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZresSawAsDsp [

	self assert: CZresSaw new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZresTrapAsDsp [

	self assert: CZresTrap new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZresTriangleAsDsp [

	self assert: CZresTriangle new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZsawAsDsp [

	self assert: CZsaw new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZsawPAsDsp [

	self assert: CZsawP new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZsinePulseAsDsp [

	self assert: CZsinePulse new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZsinePulsePAsDsp [

	self assert: CZsinePulseP new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCZsquarePAsDsp [

	self assert: CZsquareP new asDsp isNull equals: false
]

{ #category : 'tests' }
OscillatorsTest >> testCosWaveformAsDsp [

	self deny: CosWaveform new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testHsOscCosAsDsp [

	self deny: HsOscCos new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testHsOscSinAsDsp [

	self deny: HsOscSin new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testHsPhasorAsDsp [

	self deny: HsPhasor new stereo asDsp isNull.

]

{ #category : 'tests' }
OscillatorsTest >> testHspPhasorAsDsp [

	self deny: HspPhasor new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscCosAsDsp [

	self deny: OscCos new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscCosMAsDsp [

	self deny: OscCosM new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscIAsDsp [

	self deny: OscI new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscPAsDsp [

	self deny: OscP new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscSinAsDsp [

	self deny: OscSin new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testOscSinMAsDsp [

	self deny: OscSinM new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testPhasorAsDsp [

	self deny: Phasor new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testPulseOscAsDsp [

	self deny: PulseOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testSinWaveformAsDsp [

self deny: SinWaveform new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testSinWaveformChangeWtSizeDsp [


| osc |
osc := SinWaveform new tableSize: 512.
	self deny: osc  stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testSineOscAsDsp [

	self deny: SineOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testSquareOscAsDsp [

	self deny: SquareOsc new stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testTriOscAsDsp [

	self deny: TriOsc new stereo asDsp isNull
]
