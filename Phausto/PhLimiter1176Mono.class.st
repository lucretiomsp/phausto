"
Mono Limiter.
A limiter guards against hard-clipping. It can be implemented as a compressor having a high threshold (near the clipping level), fast attack, and high ratio. Since the compression ratio is so high, some knee smoothing is desirable (for softer limiting). This example is intended to get you started using compressors as limiters, so all parameters are hardwired here to nominal values.
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

^  self input asBox , self ratio asBox , self attack asBox , self release connectTo: super asBox.
]

{ #category : 'initialization' }
PhLimiter1176Mono >> initialize [

	super initialize.
	processExpression := 'process = co.limiter_1176_R4_mono;'.
	input := 0
]
