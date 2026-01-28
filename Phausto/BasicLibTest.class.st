Class {
	#name : 'BasicLibTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicLibTest >> TODOtestDownSamplerAsDsp [ 

	self deny: DownSampler new asDsp isNull
]

{ #category : 'tests' }
BasicLibTest >> testPhIfAsDsp [

	self deny: PhIf new asDsp isNull
]

{ #category : 'tests' }
BasicLibTest >> testPhSampleAndHoldAsDsp [

	self deny: PhSampleAndHold new asDsp isNull 
]

{ #category : 'tests' }
BasicLibTest >> testPhTestAndHoldAsDsp [

	self deny: PhTestAndHold new asDsp isNull 
]

{ #category : 'tests' }
BasicLibTest >> testPulseAsDsp [

	self assert: Pulse new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicLibTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]
