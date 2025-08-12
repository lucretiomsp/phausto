Class {
	#name : 'PhPrimes',
	#superclass : 'PhUnaryOperation',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhPrimes >> initialize [ 

super initialize .
processExpression := 'process = ma.primes;'
]
