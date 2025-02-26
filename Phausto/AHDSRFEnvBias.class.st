"
**AHDSR** (_Attack_, _Hold_, _Decay_, _Sustain_, _Release_) envelope generator with control over bias on each segment, and toggle for legato.

## Parameters

- **attack**: attack time (sec)
- **decay**: decay time (sec)
- **hold**: time (sec)
- **sustain**: sustain level (between 0..1)
- **release**: release time (sec)
- **finalLevek**: (between 0..1)
- **biasAttack**: bias during attack (between 0..1) where 0.5 is no bias.
- **biasDecay**: bias during decay (between 0..1) where 0.5 is no bias.
- **biasRelease**: bias during release (between 0..1) where 0.5 is no bias.
- **legato**: toggle for legato. If disabled, envelopes ""re-trigger"" from zero.
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'AHDSRFEnvBias',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain',
		'finalLevel',
		'biasAttack',
		'biasDecay',
		'biasRelease',
		'legato',
		'hold'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
AHDSRFEnvBias >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox , self hold asBox
	            , self sustain asBox , self release asBox
	            , self finalLevel asBox , self biasAttack asBox
	            , self biasDecay asBox , self biasRelease ,  self legato asBox
	            , self trigger asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> biasAttack [

	^ biasAttack ifNil: [
		  biasAttack := PhHSlider new
			             label: self label , 'BiasAttack'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> biasDecay [

	^ biasDecay ifNil: [
		  biasDecay := PhHSlider new
			             label: self label , 'BiasDecay'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> biasRelease [

	^ biasRelease ifNil: [
		  biasRelease := PhHSlider new
			             label: self label , 'BiasRelease'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> decay [

	^ decay ifNil: [
		  decay := PhHSlider new
			           label: self label , 'Decay'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> finalLevel [

	^ finalLevel ifNil: [
		  finalLevel := PhHSlider new
			             label: self label , 'FinalLevel'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> hold [

	^ hold ifNil: [
		  hold := PhHSlider new
			             label: self label , 'Hold'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'initialization' }
AHDSRFEnvBias >> initialize [

	super initialize.

	processExpression := 'process = en.adsrf_bias;'
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> legato [

"TODO must be changed to a UI toggle!!!!!!!!!!!!!!!"
	^ legato ifNil: [
		  legato := PhHSlider new
			             label: self label , 'Legato'
			             init: 0
			             min: 0
			             max: 1
			             step: 1 ]
]

{ #category : 'as yet unclassified' }
AHDSRFEnvBias >> sustain [

	^ sustain ifNil: [
		sustain := PhHSlider new
			           label: self label , 'Sustain'
			           init: 0.5
			           min: 0
			           max: 1
			           step: 0.001 ]
]
