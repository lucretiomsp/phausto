Class {
	#name : 'AntiAliasedTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
AntiAliasedTest >> testASinh1AsDsp [

	self assert: ASinh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testASinh2AsDsp [

	self assert: ASinh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcTan2AsDsp [

	self assert: ArcTan2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcTanAsDsp [

	self assert: ArcTan new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testCubic1AsDsp [

	self assert: Cubic1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testHardclip2AsDsp [

	self assert: Hardclip2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testHardclipAsDsp [

	self assert: Hardclip new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testHyperbolic2AsDsp [

	self assert: Hyperbolic2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testHyperbolicAsDsp [

	self assert: Hyperbolic new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testParabolic2AsDsp [

	self assert: Parabolic2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testParabolicAsDsp [

	self assert: Parabolic new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testSoftClipQuadratic1AsDsp [

	self assert: SoftClipQuadratic1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testSoftClipQuadratic2AsDsp [

	self assert: SoftClipQuadratic2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testTanh1AsDsp [

	self assert: Tanh1 new asDsp isNull equals: false
]
