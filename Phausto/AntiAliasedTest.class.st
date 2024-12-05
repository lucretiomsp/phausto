Class {
	#name : 'AntiAliasedTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
AntiAliasedTest >> testAASine2Dsp [

	self assert: AASine2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testAASineDsp [

	self assert: AASine new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testACosh1Dsp [

	self assert: ACosh1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testACosh2Dsp [

	self assert: ACosh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testASinh1AsDsp [

	self assert: ASinh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testASinh2AsDsp [

	self assert: ASinh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcCos2Dsp [

	self assert: ArcCos2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcCosDsp [

	self assert: ArcCos new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcSin2Dsp [

	self assert: ArcSin2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testArcSinDsp [

	self assert: ArcSin new asDsp isNull equals: false
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
AntiAliasedTest >> testAtanh1Dsp [

	self assert: ATanh1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testAtanh2Dsp [

	self assert: ATanh2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testCosine1Dsp [

	self assert: Cosine1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testCosine2Dsp [

	self assert: Cosine2 new asDsp isNull equals: false
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

"avoid crash"
self assert: 1 equals: 0.

	self assert: SoftClipQuadratic1 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testSoftClipQuadratic2AsDsp [

"avoid crash"
self assert: 1 equals: 0.



	self assert: SoftClipQuadratic2 new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testTangentDsp [

	self assert: Tangent new asDsp isNull equals: false
]

{ #category : 'tests' }
AntiAliasedTest >> testTanh1AsDsp [


"avoid crash"
self assert: 1 equals: 0.

	self assert: Tanh1 new asDsp isNull equals: false
]
