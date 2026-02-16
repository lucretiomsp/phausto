"
Return the n-th prime using a waveform primitive. Note that primes(0) is 2, primes(1) is 3, and so on. The waveform is length 2048, so the largest precomputed prime is primes(2047) which is 17863.
"
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
