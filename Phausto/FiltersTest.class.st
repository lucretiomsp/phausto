Class {
	#name : 'FiltersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
FiltersTest >> testDiodeLadder [

	self assert: DiodeLadder new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testLowPassFilter [

self assert: Lowpass new  asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testMoogVcf [

self assert: MoogVcf new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonBp [

self assert: ResonBp new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonHp [

self assert: ResonHp new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonLp [

self assert: ResonLp new asDsp isNull equals: false
]
