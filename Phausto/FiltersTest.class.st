Class {
	#name : 'FiltersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
FiltersTest >> testLowPassFilter [

self assert: Lowpass new  asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testMoogVcf [

self assert: MoogVcf new asDsp isNull equals: false
]
