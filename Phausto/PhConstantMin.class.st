"
Constant MIN available in simple/double/quad precision (minimal positive value).
"
Class {
	#name : 'PhConstantMin',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhConstantMin >> initialize [

	super initialize.
	self processExpression: 'process = ma.MIN;'
]
