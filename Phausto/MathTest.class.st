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
MathTest >> testPHChebychevAsDsp [


self assert: 1 equals: 0.

	self deny: PhChebychev new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHChebychevPolyAsDsp [

	self deny: PhChebychevPoly new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHConstantEAsDsp [

	self deny: PhConstantE new asDsp isNull
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
MathTest >> testPHCopySignAsDsp [

	self deny: PhCopySign new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHCubeRootAsDsp [

	self deny: PhCubeRoot new asDsp isNull
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
MathTest >> testPHEpsilonnAsDsp [

	self deny: PhEpsilon new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHErfAsDsp [

	self deny: PhErf new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHErfCAsDsp [

	self deny: PhErfC new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHExpM1AsDsp [

	self deny: PhExpM1 new asDsp isNull
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
MathTest >> testPHHypotenuseAsDsp [

	self deny: PhHypothenuse new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHILogBAsDsp [

	self deny: PhILogB new asDsp isNull
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
MathTest >> testPHIsNanAsDsp [


   self deny: 1 = 1.
	self deny: PhIsNan new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHJ0AsDsp [

self deny: 1 = 1.
	self deny: PhJ0 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHJ1AsDsp [

self deny: 1 = 1.
	self deny: PhJ1 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHJnAsDsp [

self deny: 1 = 1.
	self deny: PhJn new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHLGammaAsDsp [
self deny: 1 = 1.
	self deny: PhLGamma new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHLdExpAsDsp [
self deny: 1 = 1.
	self deny: PhLdExp new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHLog1pAsDsp [
self deny: 1 = 1.
	self deny: PhLog1p new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHLog2pAsDsp [
self deny: 1 = 1.
	self deny: PhLog2 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHLogBpAsDsp [
self deny: 1 = 1.
	self deny: PhLogB new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPHModuloMathAsDsp [

self deny: 1 =1 .
	self deny: PhModuloMath new asDsp isNull
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
MathTest >> testPhScalbAsDsp [

	self deny: 1 = 1.
	self deny: PhScalb new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhSignumAsDsp [

	self deny: PhSignum new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhSubAsDsp [

self deny: 1 = 1.
	self deny: PhSub new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhY0AsDsp [


	
	self deny: 1 =1 .
	self deny: PhY0 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhY1AsDsp [

self deny: 1 = 1.
	self deny: PhY1 new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhYnAsDsp [

self deny: 1 = 1.
	self deny: PhYn new asDsp isNull
]

{ #category : 'tests' }
MathTest >> testPhZeroCrossingAsDsp [

	self deny: PhZeroCrossing new asDsp isNull
]
