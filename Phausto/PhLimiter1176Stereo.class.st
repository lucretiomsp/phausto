"
Stereo limiter
A limiter guards against hard-clipping. It can be implemented as a compressor having a high threshold (near the clipping level), fast attack and release, and high ratio. Since the ratio is so high, some knee smoothing is desirable (""soft limiting""). 
"
Class {
	#name : 'PhLimiter1176Stereo',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhLimiter1176Stereo >> asBox [ 

^  self inputL asBox , self inputR asBox connectTo: super asBox.
]

{ #category : 'initialization' }
PhLimiter1176Stereo >> initialize [

	super initialize.
	processExpression := 'process = co.limiter_1176_R4_stereo;'.
	inputL := 0 asBox.
	inputR := 0 asBox.

]
