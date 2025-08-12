Class {
	#name : 'PhConstantMax',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhConstantMax >> initialize [

	super initialize.
	self processExpression: 'process = ma.MAX;'
]
