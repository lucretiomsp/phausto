"
Gives the fractional part of its input

##Parameter
**input:** a decimal number
"
Class {
	#name : 'PhFrac',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhFrac >> initialize [ 

super initialize .

processExpression := 'process = ma.frac;'
]
