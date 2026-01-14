"
Stereo dynamic range expander gain computer. 

## Parameters:

**strength:** strength of the expansion (0 = no expansion, 100 means gating, <1 means upward compression)
**thresh:** dB level threshold below which expansion kicks in
**range:** maximum amount of expansion in dB
**att:** attack time = time constant (sec) coming out of expansion
**hold:** hold time (sec)
**rel:** release time = time constant (sec) going into expansion
**knee:** a gradual increase in gain reduction around the threshold: above thresh+(knee/2) there is no gain reduction, below thresh-(knee/2) there is the same gain reduction as without a knee, and in between there is a gradual increase in gain reduction
**prePost:** places the level detector either at the input or after the gain computer; this turns it from a linear return-to-zero detector into a log domain return-to-range detector
**link:** the amount of linkage between the channels: 0 = each channel is independent, 1 = all channels have the same amount of gain reduction


"
Class {
	#name : 'PhPeakExpansionGainStereo',
	#superclass : 'PhExpander',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhPeakExpansionGainStereo >> asBox [

	^ self inputL asBox , self inputR asBox , self strength asBox
	  , self threshold asBox , self range asBox , self attack asBox
	  , self release asBox , self hold asBox , self knee asBox
	  , self prePost asBox , self link asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhPeakExpansionGainStereo >> initialize [

	super initialize.
	self initializeProcessExpression.

]

{ #category : 'initialization' }
PhPeakExpansionGainStereo >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"

	^ processExpression := 'import("stdfaust.lib");
 
   expander2ch(strength, thresh, rng , att, rel, hol , knee, prePost, linkv ) =
   co.peak_expansion_gain_N_chan_db(strength, thresh, rng , att, rel, hol, knee, prePost, linkv, 2048 ,2);
   process = expander2ch;'
]
