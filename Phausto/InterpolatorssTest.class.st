Class {
	#name : 'InterpolatorssTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
InterpolatorssTest >> testPhInterpolateLinearAsDsp [

	self deny: PhInterpolateLinear new asDsp isNull
]

{ #category : 'tests' }
InterpolatorssTest >> testPhInterpolateRaiseModuloAsDsp [

	self deny: PhInterpolateRaiseModulo new asDsp isNull
]
