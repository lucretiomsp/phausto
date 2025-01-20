Class {
	#name : 'SignalsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
SignalsTest >> testPhBusAsDsp [

	self assert: PhBus new asDsp isNull equals: false
]

{ #category : 'tests' }
SignalsTest >> testPhInterpolateAsDsp [

	self assert: PhInterpolate new asDsp isNull equals: false
]
