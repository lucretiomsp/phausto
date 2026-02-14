"
Constant PI in double precision.
"
Class {
	#name : 'PhConstantPI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhConstantPI >> initialize [ 
super initialize.
processExpression := 'process = ma.PI;'
]
