Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> testDownSamplerAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0.
	self assert: DownSampler new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testImpulsifyAsDsp [

	self assert: Impulsify new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhAutomatAsDsp [
	
	self assert: PhAutomat new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSampleAndHoldAsDsp [

	self assert: SampleAndHold new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSelectNAsDsp [

	self assert: PhSelectN new asDsp isNull equals: false
]
