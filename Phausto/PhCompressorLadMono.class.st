"
Mono dynamic range compressor with lookahead delay from Faust standard library.

Parameters:
**lad:**lookahead delay in seconds (nonnegative) - gets rounded to nearest sample. The effective attack time is a good setting
**ratio:**l compression ratio (1 = no compression, >1 means compression) Ratios: 4 is moderate compression, 8 is strong compression, 12 is mild limiting, and 20 is pretty hard limiting at the threshold
**lthreshold:**l dB level threshold above which compression kicks in (0 dB = max level)
**lattack:**l attack time = time constant (sec) when level & compression are going up
**lrelease:**l release time = time constant (sec) coming out of compression
"
Class {
	#name : 'PhCompressorLadMono',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhCompressorLadMono >> asBox [

	^ self input asBox , self lad asBox , self ratio asBox
	  , self threshold asBox , self attack asBox , self release asBox
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhCompressorLadMono >> initialize [

	super initialize.
	processExpression := 'process = co.compressor_lad_mono;'.
	input := 0.
	lad := 0.005
]
