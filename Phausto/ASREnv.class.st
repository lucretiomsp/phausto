"
**ASR** (_Attack_, _Sustain_, _Release_) envelope generator

## Parameters

-** attack**: attack time(sec)
- **sustain**: sustain level(between 0..1)
- **release**: release time (sec)
-**trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ASREnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
ASREnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self sustain asBox
	            , self release asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
ASREnv >> initialize [

	super initialize.
	processExpression := 'process = en.asr;'
]

{ #category : 'as yet unclassified' }
ASREnv >> sustain [

	^ sustain ifNil: [
		  sustain := PhHSlider new
			             label: self label , 'Sustain'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]
