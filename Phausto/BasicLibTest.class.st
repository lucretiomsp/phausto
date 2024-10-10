Class {
	#name : 'BasicLibTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicLibTest >> testPulseAsDsp [

	self assert: Pulse new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicLibTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicLibTest >> testSampleAndHoldAsDsp [

	self assert: SampleAndHold new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicLibTest >> testSec2Samples [

	self assert: Sec2Samples  new asDsp isNull equals: false
]
