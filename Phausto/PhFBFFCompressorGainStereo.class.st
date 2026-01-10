"
Feed forward / feed back stereo dynamic range compressor. The feedback part has a much higher strength, so they end up sounding similar
## Parameters:

**strength:** strength of the compression (0 = no compression, 1 means hard limiting, >1 means over-compression)
**threshold:** dB level threshold above which compression kicks in
**attack:** attack time = time constant (sec) when level & compression going up
**release:** release time = time constant (sec) coming out of compression
**knee:** a gradual increase in gain reduction around the threshold: below thresh-(knee/2) there is no gain reduction, above thresh+(knee/2) there is the same gain reduction as without a knee, and in between there is a gradual increase in gain reduction
**prePost:** places the level detector either at the input or after the gain computer; this turns it from a linear return-to-zero detector into a log domain return-to-threshold detector.
**link:** the amount of linkage between the channels: 0 = each channel is independent, 1 = all channels have the same amount of gain reduction


Sometimes even bigger ratios are useful: for example a group recording where one instrument is recorded with both a close microphone and a room microphone, and the instrument is loud enough in the room mic when playing loud, but you want to boost it when it is playing soft.


"
Class {
	#name : 'PhFBFFCompressorGainStereo',
	#superclass : 'PhCompressor',
	#instVars : [
		'fbff'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhFBFFCompressorGainStereo >> asBox [

	^ self inputL asBox , self inputR asBox , self strength asBox , self threshold asBox , self attack asBox , self release asBox
	  , self knee asBox , self prePost asBox , self link asBox , self fbff asBox , Wire new asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhFBFFCompressorGainStereo >> fbff [ 
^ fbff
]

{ #category : 'initialization' }
PhFBFFCompressorGainStereo >> initialize [

	super initialize.
	self initializeProcessExpression.
	fbff := PhHSlider new label: 'CompressorFBFF' values: #(0.5 0 1 0.01).
]

{ #category : 'initialization' }
PhFBFFCompressorGainStereo >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"

	^ processExpression := 'import("stdfaust.lib");
   meter = _;
   compressor2ch(strength, thresh, att, rel, knee, prePost, linkv , fbff , meter) =
   co.FBFFcompressor_N_chan(strength, thresh, att, rel, knee, prePost, linkv, fbfff , meter , 2);
   process = compressor2ch;'
]

{ #category : 'accessing' }
PhFBFFCompressorGainStereo >> link [ 
^ link
]
