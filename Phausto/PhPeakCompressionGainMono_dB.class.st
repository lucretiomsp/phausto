"
Mono RMS dynamic range compressor gain computer with linear output. 

## Parameters:

**strength:** strength of the compression (0 = no compression, 1 means hard limiting, >1 means over-compression)
**threshold:** dB level threshold above which compression kicks in
**attack:** attack time = time constant (sec) when level & compression going up
**release:** release time = time constant (sec) coming out of compression
**knee:** a gradual increase in gain reduction around the threshold: below thresh-(knee/2) there is no gain reduction, above thresh+(knee/2) there is the same gain reduction as without a knee, and in between there is a gradual increase in gain reduction
**prePost:** places the level detector either at the input or after the gain computer; this turns it from a linear return-to-zero detector into a log domain return-to-threshold detector
It uses a strength parameter instead of the traditional ratio, in order to be able to function as a hard limiter. For that you'd need a ratio of infinity:1, and you cannot express that in Faust.

Sometimes even bigger ratios are useful: for example a group recording where one instrument is recorded with both a close microphone and a room microphone, and the instrument is loud enough in the room mic when playing loud, but you want to boost it when it is playing soft.


"
Class {
	#name : 'PhPeakCompressionGainMono_dB',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhPeakCompressionGainMono_dB >> asBox [

	^ self input asBox , self strength asBox 
	  , self threshold asBox , self attack asBox , self release asBox , self knee asBox , self prePost  asBox 
		  connectTo: super asBox
]

{ #category : 'initialization' }
PhPeakCompressionGainMono_dB >> initialize [

	super initialize.
	processExpression := 'process = co.RMS_compression_gain_mono_db;'.
	input := 0.
	strength := PhHSlider new label: 'Strength' values: #( 0.5 0 1 0.01 ).
	knee := PhHSlider new label: 'Knee' values: #( 6 1 10 0.01 ). "level detector is at the input"
	prePost := 0
]
