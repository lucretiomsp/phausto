"
Stereo channel RMS feed back compressor into peak limiter feeding back into the FB compressor. By combining them this way, they complement each other optimally: the RMS compressor doesn't have to deal with the peaks, and the peak limiter get's spared from the steady state signal. The feedback part has a much higher strength, so they end up sounding similar
## Parameters:

**strength:** strength of the compression (0 = no compression, 1 means hard limiting, >1 means over-compression)
**threshold:** dB level threshold above which compression kicks in
**attack:** attack time = time constant (sec) when level & compression going up
**release:** release time = time constant (sec) coming out of compression
**knee:** a gradual increase in gain reduction around the threshold: below thresh-(knee/2) there is no gain reduction, above thresh+(knee/2) there is the same gain reduction as without a knee, and in between there is a gradual increase in gain reduction
**prePost:** places the level detector either at the input or after the gain computer; this turns it from a linear return-to-zero detector into a log domain return-to-threshold detector.
**link:** the amount of linkage between the channels: 0 = each channel is independent, 1 = all channels have the same amount of gain reduction
**meter:** compressor gain reduction meter. It can be implemented with: 
```language=C
meter = _<:(_,(max(maxGR):meter_group((hbargraph(""[1][unit:dB][tooltip: gain reduction in dB]"", maxGR, 0))))):attach;
```
**meterLim:** brickwall limiter gain reduction meter. It can be implemented with: 
```language=C
meterLim = _<:(_,(max(maxGR):meter_group((hbargraph(""[1][unit:dB][tooltip: gain reduction in dB]"", maxGR, 0))))):attach;
```

Sometimes even bigger ratios are useful: for example a group recording where one instrument is recorded with both a close microphone and a room microphone, and the instrument is loud enough in the room mic when playing loud, but you want to boost it when it is playing soft.


"
Class {
	#name : 'PhRMSFBCompressorGainStereo',
	#superclass : 'PhCompressor',
	#instVars : [
		'threshLim'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhRMSFBCompressorGainStereo >> asBox [

	^ self inputL asBox , self inputR asBox , self strength asBox
	  , self threshold asBox , self threshLim asBox , self attack asBox
	  , self release asBox , self knee asBox 
	  , self link asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhRMSFBCompressorGainStereo >> initialize [

	super initialize.
	self initializeProcessExpression.
	threshLim := PhHSlider new
		             label: 'CompressorThreshLimit'
		             values: #( -3 -60 0 0.1 ).
]

{ #category : 'initialization' }
PhRMSFBCompressorGainStereo >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"

	^ processExpression := 'import("stdfaust.lib");
 
   compressor2ch(strength, thresh, trLim , att, rel, knee,  linkv  ) =
   co.RMS_FBcompressor_peak_limiter_N_chan(strength, thresh, trLim , att, rel, knee, linkv, _  , _ ,  2);
   process = compressor2ch;'
]

{ #category : 'accessing' }
PhRMSFBCompressorGainStereo >> link [ 
^ link
]

{ #category : 'accessing' }
PhRMSFBCompressorGainStereo >> threshLim [ 
^ threshLim
]
