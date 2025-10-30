Class {
	#name : 'NoisesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
NoisesTest >> testColoredNoise [

self deny: ColoredNoise new asDsp isNull.
]

{ #category : 'tests' }
NoisesTest >> testNoise [

	self deny: Noise new asDsp isNull
]

{ #category : 'tests' }
NoisesTest >> testPinkNoise [

	self deny: PinkNoise new asDsp isNull
]

{ #category : 'tests' }
NoisesTest >> testSparseNoise [

	self deny: SparseNoise new asDsp isNull
]
