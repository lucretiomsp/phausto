Class {
	#name : 'MathTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
MathTest >> testPHBlockSizeAsDsp [

	self deny: PhBlockSize new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantEAsDsp [

	self deny: PhConstantE new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantEpsilonAsDsp [

	self deny: PhConstantEpsilon new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantMaxAsDsp [

	self deny: PhConstantMax new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantMinAsDsp [

	self deny: PhConstantMin new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantPIAsDsp [

	self deny: PhConstantT new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantTAsDsp [

	self deny: PhConstantT new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHCopySignAsDsp [

	self deny: PhCopySign new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHDeg2RadAsDsp [

	self deny: PhDeg2Rad new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHDiffnAsDsp [

	self deny: PhDiffn new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHFTZAsDsp [

	self deny: PhFTZ new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHFracAsDsp [

	self deny: PhFrac new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHInverseAsDsp [

	self deny: PhInverse new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHIsInfAsDsp [

	self deny: PhIsInf new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHNegAsDsp [

	self deny: PhNeg new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHNextPowerOf2AsDsp [

	self deny: PhNextPowerOf2 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhRad2DegAsDsp [

	self deny: PhRad2Deg new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhSignumAsDsp [

	self deny: PhSignum new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhZeroCrossingAsDsp [

	self deny: PhZeroCrossing new asDsp isNull
]
