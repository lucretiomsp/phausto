Class {
	#name : 'SaturatorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
SaturatorsTest >> testASinh1sDsp [

	self deny: ASinh1 new asDsp isNull
]

{ #category : 'tests' }
SaturatorsTest >> testASinh2sDsp [

	self deny: ASinh1 new asDsp isNull
]

{ #category : 'tests' }
SaturatorsTest >> testArcTan2sDsp [

	self deny: ArcTan2 new asDsp isNull
]

{ #category : 'tests' }
SaturatorsTest >> testArcTansDsp [

	self deny: ArcTan new asDsp isNull
]

{ #category : 'tests' }
SaturatorsTest >> testCubic1Dsp [

	self deny: Cubic1 new asDsp isNull
]

{ #category : 'tests' }
SaturatorsTest >> testHardclipDsp [

	self deny: Hardclip new asDsp isNull
]
