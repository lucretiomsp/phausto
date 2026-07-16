Class {
	#name : 'InterpolatorssTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
InterpolatorssTest >> testPhInterpolateLinearAsDsp [

	| case |
	case := PhInterpolateLinear new
		        dv: 0.5 asBox;
		        v0: 1 asBox;
		        v1: 1.8 asBox.
	self deny: case asDsp isNull
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
