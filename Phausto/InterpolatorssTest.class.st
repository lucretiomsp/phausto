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

	| case |
	case := PhInterpolateRaiseModulo new
		        trig: 1 asBox;
		        step: 0.01 asBox ;
		        length: 100 asBox.
	self deny: case asDsp isNull
]
