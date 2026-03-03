Class {
	#name : 'SignalsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
SignalsTest >> testPhBlockSignaalAsDsp [

	self deny: PhBlockSignal new asDsp isNull 
]

{ #category : 'tests' }
SignalsTest >> testPhBusAsDsp [

	self deny: PhBus new asDsp isNull 
]

{ #category : 'tests' }
SignalsTest >> testPhInterpolateAsDsp [

	self assert: PhInterpolate new asDsp isNull equals: false
]
