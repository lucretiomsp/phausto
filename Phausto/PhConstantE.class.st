Class {
	#name : 'PhConstantE',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhConstantE >> initialize [

	super initialize.
	self processExpression: 'process = ma.E;'
]
