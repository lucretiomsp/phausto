"
**ADSR** (_Attack_, _Decay_, _Sustain_, _Release_)  envelope generator with control over bias on each segment, and toggle for legato.

## Parameters:

- **attack**: attack time (sec)
- **decay**: decay time (sec)
- **sustain**: sustain level (between 0..1)
- **release**: release time (sec)
- **finalLevel**: final level (between 0..1) but less than or equal to sl
- **biasAttack**: bias during attack (between 0..1) where 0.5 is no bias.
- **biasDecay**: bias during decay (between 0..1) where 0.5 is no bias.
- **biasRelease**: bias during release (between 0..1) where 0.5 is no bias.
- **legato**: toggle for legato. If disabled, envelopes ""re-trigger"" from zero.
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ADSRFEnvBias',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain',
		'finalLevel',
		'biasAttack',
		'biasDecay',
		'biasRelease',
		'legato'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
ADSRFEnvBias >> asBox [

	| intermediateBox finalBox group |
	intermediateBox := super asBox.
	group := self attack asBox , self decay asBox , self sustain asBox
	            , self release asBox , self finalLevel asBox
	            , self biasAttack asBox , self biasDecay asBox
	            , self biasRelease asBox , self legato asBox
	            , self trigger asBox .
	finalBox := group connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
ADSRFEnvBias >> biasAttack [

	^ biasAttack 
]

{ #category : 'accessing' }
ADSRFEnvBias >> biasDecay [

	^ biasDecay 
]

{ #category : 'accessing' }
ADSRFEnvBias >> biasRelease [

	^ biasRelease 
]

{ #category : 'accessing' }
ADSRFEnvBias >> decay [

	^ decay ifNil: [
		  decay := PhHSlider new
			           label: self label , 'Decay'
			           init: 0.01
			           min: 0.001
			           max: 2
			           step: 1 ]
]

{ #category : 'accessing' }
ADSRFEnvBias >> finalLevel [

	^ finalLevel 
]

{ #category : 'initialization' }
ADSRFEnvBias >> initialize [

	super initialize.

	processExpression := 'process = en.adsrf_bias;'.
	self initializeDecayAndSustain.
	self initializeBias.
	finalLevel := PhHSlider new
		              label: self label , 'FinalLevel'
		              init: 0.5
		              min: 0
		              max: 1
		              step: 0.001.
	legato := PhHSlider new
		          label: self label , 'Legato'
		          init: 0
		          min: 0
		          max: 1
		          step: 1
]

{ #category : 'initialization' }
ADSRFEnvBias >> initializeBias [

	biasAttack := PhHSlider new
		              label: self label , 'BiasAttack'
		              init: 0.5
		              min: 0
		              max: 1
		              step: 0.001.

	biasDecay := PhHSlider new
		             label: self label , 'BiasDecay'
		             init: 0.5
		             min: 0
		             max: 1
		             step: 0.001.
		
	
biasRelease := PhHSlider new
			                 label: self label , 'BiasRelease'
			                 init: 0.5
			                 min: 0
			                 max: 1
			                 step: 0.001 
]

{ #category : 'initialization' }
ADSRFEnvBias >> initializeDecayAndSustain [

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
ADSRFEnvBias >> legato [

"TODO must be changed to a UI toggle!!!!!!!!!!!!!!!"
	^ legato ifNil: [
		  legato := PhHSlider new
			             label: self label , 'Legato'
			             init: 0
			             min: 0
			             max: 1
			             step: 1 ]
]

{ #category : 'accessing' }
ADSRFEnvBias >> sustain [

	^ sustain ifNil: [
		sustain := PhHSlider new
			           label: self label , 'Sustain'
			           init: 0.5
			           min: 0
			           max: 1
			           step: 0.001 ]
]
