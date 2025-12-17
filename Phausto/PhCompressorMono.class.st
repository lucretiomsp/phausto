"
Mono dynamic range compressor from the Faust standard libray

## Parameters: 
**ratio:** compression ratio (1 = no compression, >1 means compression) Ratios: 4 is moderate compression, 8 is strong compression, 12 is mild limiting, and 20 is pretty hard limiting at the threshold
**threshold**: dB level threshold above which compression kicks in (0 dB = max level)
**attack**: attack time = time constant (sec) when level & compression are going up
**release:** release time = time constant (sec) coming out of compression
"
Class {
	#name : 'PhCompressorMono',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhCompressorMono >> asBox [

	^ self input asBox , self ratio asBox
	  , self threshold asBox , self attack asBox , self release asBox
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhCompressorMono >> initialize [

	super initialize.
	processExpression := 'process = co.compressor_mono;'.
	input := 0 .
]
