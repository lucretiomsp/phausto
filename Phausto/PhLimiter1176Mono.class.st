"
Mono Limiter
"
Class {
	#name : 'PhLimiter1176Mono',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhLimiter1176Mono >> asBox [ 

^  self input asBox connectTo: super asBox.
]

{ #category : 'initialization' }
PhLimiter1176Mono >> initialize [

	super initialize.
	processExpression := 'process = co.limiter_1176_R4_mono;'.
	input := 0 asBox.
]
