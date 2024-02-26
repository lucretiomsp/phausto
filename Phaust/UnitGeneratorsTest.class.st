Class {
	#name : #UnitGeneratorsTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
UnitGeneratorsTest >> testNoiseAsDsp [

	self assert: Noise new asDsp isNull equals: false
]

{ #category : #tests }
UnitGeneratorsTest >> testPulseOscAsDsp [

	self assert: PulseOsc new asDsp isNull equals: false
]

{ #category : #tests }
UnitGeneratorsTest >> testSineOscAsDsp [

	self assert: SineOsc new asDsp isNull equals: false
]

{ #category : #tests }
UnitGeneratorsTest >> testSquareOscAsDsp [

	self assert: SquareOsc new asDsp isNull equals: false
]

{ #category : #tests }
UnitGeneratorsTest >> testTriOscAsDsp [

	self assert: TriOsc  new asDsp isNull equals: false
]
