Class {
	#name : 'SynthsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
SynthsTest >> testClapAsBox [

self assert: Clap new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testCombStringAsBox [

	self assert: CombString new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testDubDubAsBox [

	self assert: DubDub new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testFm4OpAsBox [

	self assert: Fm4Op new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testHatAsBox [

	self assert: Hat new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testKickAsBox [

	self assert: Kick new asDsp isNull equals: false
]

{ #category : 'tests' }
SynthsTest >> testSawTromboneAsBox [

	self assert: SawTrombone new asDsp isNull equals: false
]
