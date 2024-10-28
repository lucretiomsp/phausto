Class {
	#name : 'EffectsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EffectsTest >> testGreyHoleAsDsp [

	self assert: GreyHole new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPannerAsDsp [

	self assert: Panner new asDsp isNull equals: false
]

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

{ #category : 'tests' }
EffectsTest >> testZitaRevAsDsp [

	self assert: ZitaRevStereo new asDsp isNull equals: false
]
