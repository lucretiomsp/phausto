"
Constant EPSILON available in simple/double/quad precision, as defined in the floating-point standard and machine epsilon, that is smallest positive number such that 1.0 + EPSILON != 1.0.
"
Class {
	#name : 'PhConstantEpsilon',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhConstantEpsilon >> initialize [ 
super initialize .
processExpression := 'process = ma.EPSILON;'
]
