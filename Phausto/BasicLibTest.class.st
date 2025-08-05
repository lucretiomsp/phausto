Class {
	#name : 'BasicLibTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicLibTest >> testDownSamplerAsDsp [ 

	self deny: DownSampler new asDsp isNull
]

{ #category : 'tests' }
BasicLibTest >> testPhIfAsDsp [

	self deny: PhInterpolate new asDsp isNull
]

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
