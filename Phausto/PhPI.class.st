Class {
	#name : 'PhPI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhPI >> initialize [

	super initialize.
	self processExpression: 'process = ma.PI;'
]
