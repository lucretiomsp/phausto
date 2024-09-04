Class {
	#name : 'EffectsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EffectsTest >> testSineOscAsDsp [

	self assert: PhClip new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSoftClipQaudraticAsDsp [

	self assert: SoftClipQuadratic new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testWavefoldAsDsp [

	self assert: Wavefold new asDsp isNull equals: false
]
