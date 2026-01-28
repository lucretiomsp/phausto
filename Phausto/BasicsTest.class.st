Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> TODOtestDownSamplerAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0.
	self assert: DownSampler new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testImpulsifyAsDsp [

	self deny: Impulsify new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhAutomatAsDsp [

	self deny: PhAutomat new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhLatchAsDsp [

	self deny: PhLatch new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhSampleAndHoldAsDsp [

	self deny: PhSampleAndHold new asDsp isNull 
]
