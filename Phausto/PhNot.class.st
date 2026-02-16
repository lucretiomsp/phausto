"
Bitwise not implemented with xor as not(x) = x xor -1;. So working regardless of the size of the integer, assuming negative numbers in two's complement.
"
Class {
	#name : 'PhNot',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhNot >> initialize [

	super initialize.
	processExpression := 'process= ma.not;'
]
