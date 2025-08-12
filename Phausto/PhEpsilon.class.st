Class {
	#name : 'PhEpsilon',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhEpsilon >> initialize [

	super initialize.
	self processExpression: 'process = ma.EPSILON;'
]
