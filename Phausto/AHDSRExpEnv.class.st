"
**AHDSR** (_Attack_, _Hold_, _Decay_, _Sustain_, _Release_) envelope generator.

## Parameters

- **attack**: attack time (sec)
- **decay**: decay time (sec)
- **sustain**: sustain level (between 0..1)
- **release**: release time (sec)
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'AHDSRExpEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain',
		'hold'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
AHDSRExpEnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox , self hold asBox , self sustain asBox
	            , self release asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
AHDSRExpEnv >> decay [

	^ decay 
]

{ #category : 'accessing' }
AHDSRExpEnv >> hold [

	^ hold 
]

{ #category : 'initialization' }
AHDSRExpEnv >> initialize [

	super initialize.
	processExpression := 'process = en.ahdsre;'.
	self initializeDecayAndSustain .
	hold := PhHSlider new
			          label: self label , 'Hold'
			          init: 0.01
			          min: 0.001
			          max: 2
			          step: 1
]

{ #category : 'initialization' }
AHDSRExpEnv >> initializeDecayAndSustain [

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

{ #category : 'as yet unclassified' }
AHDSRExpEnv >> sustain [

	^ sustain 
]
