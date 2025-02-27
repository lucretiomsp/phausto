"
**ADSR** (_Attack_, _Decay_, _Sustain_, _Release_)  envelope generator with control over bias on each segment, and toggle for legato.

## Parameters
- **attack**: attack time (sec)
- **decay**: decay time (sec)
- **sustain**: sustain level (between 0..1)
- **release**: release time (sec)

- **biasAttack**: bias during attack (between 0..1) where 0.5 is no bias.
- **biasDecay**: bias during decay (between 0..1) where 0.5 is no bias.
- **biasRelease**: bias during release (between 0..1) where 0.5 is no bias.
- **legato**: toggle for legato. If disabled, envelopes ""re-trigger"" from zero.
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ADSREnvBias',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain',
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
ADSREnvBias >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox , self sustain asBox
	            , self release asBox , 0 asBox
	            , 0  asBox , 0 asBox
	            , 0asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ intermediateBox
]

{ #category : 'accessing' }
ADSREnvBias >> biasAttack [

	^ biasAttack 
]

{ #category : 'accessing' }
ADSREnvBias >> biasDecay [

	^ biasDecay 
]

{ #category : 'accessing' }
ADSREnvBias >> biasRelease [

	^ biasRelease 
]

{ #category : 'accessing' }
ADSREnvBias >> decay [

	^ decay 
]

{ #category : 'initialization' }
ADSREnvBias >> initialize [

	super initialize.

	processExpression := 'process = en.adsr_bias;'.
	self initializeDecayAndSustain.
	self initializeBias.
	legato := PhHSlider new
			            label: self label , 'Legato'
			            init: 0
			            min: 0
			            max: 1
			            step: 1 
]

{ #category : 'initialization' }
ADSREnvBias >> initializeBias [

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
ADSREnvBias >> initializeDecayAndSustain [

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
ADSREnvBias >> legato [
	"TODO must be changed to a UI toggle!!!!!!!!!!!!!!!"

	^ legato 
]

{ #category : 'accessing' }
ADSREnvBias >> sustain [

	^ sustain 
]
