Class {
	#name : 'UnitGeneratorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
UnitGeneratorsTest >> testAREnvAsDsp [

	self assert: AREnv new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testEmptyUnitGeneratorAsDsp [

	self assert: UnitGenerator  new asDsp isNull equals: false
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

	self assert: pulse uLevel class = PhBox.
	self assert: pulse uLevel asString trimLineSpaces equals: '0.5f'.
	self assert: pulse freq label equals: 'freq'.
	self assert: pulse duty init asString trimLineSpaces equals: '0.1f'
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSineOscAsDsp [

	self assert: SineOsc new asDsp isNull equals: false
]

{ #category : 'tests' }
UnitGeneratorsTest >> testSquareOscAsDsp [

	self assert: SquareOsc new asDsp isNull equals: false
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
