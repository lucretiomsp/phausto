Class {
	#name : 'UnitGeneratorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
UnitGeneratorsTest >> testAbsoluteUGen [

self assert: SineOsc new absolute asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZhalfSineAsDsp [

	self assert: CZhalfSine new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZhalfSinePAsDsp [

	self assert: CZhalfSineP new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZpulseAsDsp [

	self assert: CZpulse new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZpulsePAsDsp [

	self assert: CZpulseP new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZresSawAsDsp [

	self assert: CZresSaw new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZresTrapAsDsp [

	self assert: CZresTrap new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZresTriangleAsDsp [

	self assert: CZresTriangle new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZsawAsDsp [

	self assert: CZsaw new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZsawPAsDsp [

	self assert: CZsawP new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZsinePulseAsDsp [

	self assert: CZsinePulse new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZsinePulsePAsDsp [

	self assert: CZsinePulseP new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testCZsquarePAsDsp [

	self assert: CZsquareP new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testDivideUGens [

self assert: (SineOsc new / SquareOsc new) asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testEmptyUnitGeneratorAsDsp [

	self assert: UnitGenerator  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFORandomPosAsDsp [

	self assert: LFORandomPos new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOSawAsDsp [

	self assert: LFOSaw new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOSawPosAsDsp [

	self assert: LFOSawPos  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOSquareAsDsp [

	self assert: LFOSquare  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOSquarePosAsDsp [

	self assert: LFOSquarePos  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOTriAsDsp [

	self assert: LFOTri  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testLFOTriPosAsDsp [

	self assert: LFOTriPos  new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testMultiplyUGens [

self assert: (SineOsc new * SquareOsc new) asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testNoUnitGeneratorsatStartup [

	self assert: UnitGenerator instancesInDSPContext equals: 0.
	self
		assert: (UnitGenerator allSubclasses allSatisfy: [ :a | a instancesInDSPContext = 0 ])
		equals: true
]

{ #category : 'tests' }
UnitGeneratorsTest >> testNoiseAsDsp [

	self assert: Noise new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testParallelUGens [

self assert: (SineOsc new , SquareOsc new) asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testPulseOscAsDsp [

	self assert: PulseOsc new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSetOscillatorParameters [

	| pulse |
	pulse := PulseOsc new.
	pulse uLevel: 0.5 asBox.
	pulse freq: #freq.
	pulse duty: 0.1.

	self assert: pulse uLevel class equals: PhBox.
	self assert: pulse uLevel asString trimLineSpaces equals: '0.5f'.
	self assert: pulse freq label equals: 'freq'.
	self assert: pulse duty init asString trimLineSpaces equals: '0.1'
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSineOscAsDsp [

	self assert: SineOsc new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSparseNoiseAsDsp [

	self deny: SparseNoise new asDsp isNull
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSquareOscAsDsp [

	self assert: SquareOsc new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSubtractUGens [

self assert: (SineOsc new - SquareOsc new) asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSumUGens [

self assert: (SineOsc new + SquareOsc new) asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testTriOscAsDsp [

	self assert: TriOsc new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testZeroInstancesAtStartup [

"test at startup"
self assert: UnitGenerator instancesInDSPContext equals: 0
]
