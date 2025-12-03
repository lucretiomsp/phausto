"
Mono Limiter
"
Class {
	#name : 'PhLimiter1176Mono',
	#superclass : 'Limiters',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhLimiter1176Mono >> asBox [ 
self shouldBeImplemented 
]

{ #category : 'initialization' }
PhLimiter1176Mono >> initialize [

	super initialize.
	processExpression := 'process = co.limiter_1176_R4_mono;'
]
