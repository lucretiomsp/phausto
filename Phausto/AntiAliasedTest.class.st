Class {
	#name : 'AntiAliasedTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
AntiAliasedTest >> testAASine2Dsp [

	self deny: AASine2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testAASineDsp [

	self deny: AASine new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testACosh1Dsp [

	self deny: ACosh1 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testACosh2Dsp [

	self deny: ACosh2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testASinh1AsDsp [

	self deny: ASinh2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testASinh2AsDsp [

	self deny: ASinh2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcCos2Dsp [

	self deny: ArcCos2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcCosDsp [

	self deny: ArcCos new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcSin2Dsp [

	self deny: ArcSin2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcSinDsp [

	self deny: ArcSin new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcTan2AsDsp [

	self deny: ArcTan2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testArcTanAsDsp [

	self deny: ArcTan new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testAtanh1Dsp [

	self deny: ATanh1 new asDsp isNull 
]

{ #category : 'tests' }
AntiAliasedTest >> testAtanh2Dsp [

	self deny: ATanh2 new asDsp isNull 
]

{ #category : 'tests' }
AntiAliasedTest >> testCosine1Dsp [

	self deny: Cosine1 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testCosine2Dsp [

	self deny: Cosine2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testCubic1AsDsp [

	self deny: Cubic1 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testHardclip2AsDsp [

	self deny: Hardclip2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testHardclipAsDsp [

	self deny: Hardclip new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testHyperbolic2AsDsp [

	self deny: Hyperbolic2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testHyperbolicAsDsp [

	self deny: Hyperbolic new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testParabolic2AsDsp [

	self deny: Parabolic2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testParabolicAsDsp [

	self deny: Parabolic new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testSoftClipQuadratic1AsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"

	
	self deny: SoftClipQuadratic1 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testSoftClipQuadratic2AsDsp [
	"avoid crash"

	
	self deny: SoftClipQuadratic2 new asDsp isNull
]

{ #category : 'tests' }
AntiAliasedTest >> testTangentDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"

	self assert: Tangent new asBox equals: 'You cannot use this class. Somethig wrong in the Faaust library'
]

{ #category : 'tests' }
AntiAliasedTest >> testTanh1AsDsp [
	"real test charashes image, apparently for no good reason - somethig wrong in the Faaust library??"


	self deny: Tanh1 new asDsp isNull
]
