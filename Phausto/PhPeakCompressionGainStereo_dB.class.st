"
Stereo dynamic range compressor gain computer with dB output from Faust standard library

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
	#name : 'PhPeakCompressionGainStereo_dB',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhPeakCompressionGainStereo_dB >> asBox [

	^ self inputL asBox , self inputR asBox  ,  self strength asBox , self threshold asBox
	  , self attack asBox , self release asBox , self knee asBox
	  , self prePost asBox , self link asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhPeakCompressionGainStereo_dB >> initialize [

	super initialize.
	self initializeProcessExpression.
	
]

{ #category : 'initialization' }
PhPeakCompressionGainStereo_dB >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"

	^ processExpression := 'import("stdfaust.lib");

compressor2ch(strength, thresh, att, rel, knee, prePost, linkv) =
    co.peak_compression_gain_N_chan_db(
        strength, thresh, att, rel, knee, prePost, linkv, 2
    );

process = compressor2ch;'
]

{ #category : 'accessing' }
PhPeakCompressionGainStereo_dB >> link [ 
^ link
]
