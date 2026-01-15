"
Stereo lookahead limiter inspired by IOhannes Zmölnig's post, which is in turn based on the thesis by Peter Falkner ""Entwicklung eines digitalen Stereo-Limiters mit Hilfe des Signalprozessors DSP56001"". This version of the limiter uses a peak-holder with smoothed attack and release based on tau time constant filters.

## Parameters

**ceiling:** is the linear amplitude output limit
**attack:** is the attack time in seconds
**hold:** is the hold time in seconds
**release:** is the release time in seconds
"
Class {
	#name : 'PhLimiterLadMono',
	#superclass : 'PhLookaheadLimiter',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhLimiterLadMono >> asBox [

	^ self inputL asBox , self inputR asBox ,  self ceiling asBox , self attack asBox
	  , self hold asBox , self release asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhLimiterLadMono >> initialize [

	super initialize.
	self initializeProcessExpression

]

{ #category : 'initialization' }
PhLimiterLadMono >> initializeProcessExpression [ 

| peStream |
peStream := ReadWriteStream on: ''.
	peStream << 'process = co.limiter_lad_stereo('.
	self ld printOn: peStream.
	peStream << ');'.
	processExpression := peStream contents
]
