Class {
	#name : 'OscillatorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
OscillatorsTest >> testCZhalfSineAsDsp [

	self deny: CZhalfSine new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZhalfSinePAsDsp [

	self deny: CZhalfSineP new asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testCZpulseAsDsp [

	self deny: CZpulse new asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testCZpulsePAsDsp [

	self deny: CZpulseP new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZresSawAsDsp [

	self deny: CZresSaw new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZresTrapAsDsp [

	self deny: CZresTrap new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZresTriangleAsDsp [

	self deny: CZresTriangle new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZsawAsDsp [

	self deny: CZsaw new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZsawPAsDsp [

	self deny: CZsawP new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZsinePulseAsDsp [

	self deny: CZsinePulse new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZsinePulsePAsDsp [

	self deny: CZsinePulseP new asDsp isNull 
]

{ #category : 'tests' }
OscillatorsTest >> testCZsquarePAsDsp [

	self deny: CZsquareP new asDsp isNull 
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
| case |
	case := PulseOsc new freq: 200 ; duty: #dty.
	self deny: case  stereo asDsp isNull
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
| case |
	case := SineOsc new freq: 200.
	self deny: case stereo asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testSquareOscAsDsp [

| case |
case := SquareOsc new freq: 200.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
OscillatorsTest >> testTriOscAsDsp [
| case |
	case := TriOsc new freq: 200.
	self deny: case stereo asDsp isNull
]
