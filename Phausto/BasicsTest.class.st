Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> testDownSamplerAsDsp [

	self deny:  PhDownSampler new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testImpulsifyAsDsp [

	self deny: PhImpulsify new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhAutomatAsDsp [

	self deny: PhAutomat new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhBitCrusherAsDsp [

	self deny: PhBitCrusher new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhDownSamplerCVAsDsp [

	self deny: PhDownSamplerCV new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhKr2ArAsDsp [

	self deny: PhKr2Ar new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhLatchAsDsp [

	self deny: PhLatch new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhOnAndOffAsDsp [

	self deny: PhOnAndOff new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhPeakHoldAsDsp [

	self deny: PhPeakHold new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhPeakHolderAsDsp [

	self deny: PhPeakHolder new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhSampleAndHoldAsDsp [

	self deny: PhSampleAndHold new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhToggleAsDsp [

	self deny: PhToggle new asDsp isNull
]
