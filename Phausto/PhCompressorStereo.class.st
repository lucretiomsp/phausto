"
Stereo dynamic range compressor from the Faust standard libray

## Parameters: 
**ratio:** compression ratio (1 = no compression, >1 means compression) Ratios: 4 is moderate compression, 8 is strong compression, 12 is mild limiting, and 20 is pretty hard limiting at the threshold
**threshold**: dB level threshold above which compression kicks in (0 dB = max level)
**attack**: attack time = time constant (sec) when level & compression are going up
**release:** release time = time constant (sec) coming out of compression
"
Class {
	#name : 'PhCompressorStereo',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhCompressorStereo >> asBox [

	^ self inputL asBox , self inputR asBox ,  ratio asBox , self threshold asBox
	  , self attack asBox , self release asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhCompressorStereo >> initialize [

	super initialize.
	processExpression := 'process = co.compressor_mono;'.
	inputL := 0.
	inputR := 0.
]
