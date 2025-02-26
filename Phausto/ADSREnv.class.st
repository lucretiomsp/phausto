"
**ADSR** (_Attack_, _Decay_, _Sustain_, _Release_) exponential envelope generator. 

## Parameters:
- **attack**: attack time (sec)
- **decay**: decay time (sec)
- **sustain**: sustain level (between 0..1)
- **release**: release time (sec)
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ADSREnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
ADSREnv >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox , self sustain asBox
	            , self release asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
ADSREnv >> decay [

	^ decay 
]

{ #category : 'initialization' }
ADSREnv >> initialize [

	super initialize.
	processExpression := 'process = en.adsr;'.
	self initializeDecayAndSustain 
]

{ #category : 'initialization' }
ADSREnv >> initializeDecayAndSustain [

decay := PhHSlider new
		         label: self label , 'Decay'
		         init: 0.2
		         min: 0.001
		         max: 2
		         step: 1.
	sustain := PhHSlider new
		           label: self label , 'Sustain'
		           init: 0.5
		           min: 0
		           max: 1
		           step: 0.001
]

{ #category : 'accessing' }
ADSREnv >> sustain [

	^ sustain 
]
