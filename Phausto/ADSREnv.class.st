"
ADSR (Attack, Decay, Sustain, Release) envelope generator. adsr is a standard Faust function.

Where:

at: attack time (sec)
dt: decay time (sec)
sl: sustain level (between 0..1)
rt: release time (sec)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ADSREnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'decay',
		'sustain'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
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

	^ decay ifNil: [
		decay := PhHSlider new
			         label: self label , 'Decay'
			         init: 0.001
			         min: 0.001
			         max: 2
			         step: 1 ].
]

{ #category : 'accessing' }
ADSREnv >> decay: aNumberOrABox [

	decay := aNumberOrABox isNumber
		        ifTrue: [ self decay init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]
]

{ #category : 'initialization' }
ADSREnv >> initialize [

	super initialize.
	self decay: 0.2.
	self sustain: 0.5.
	processExpression := 'process = en.adsr;'
]

{ #category : 'accessing' }
ADSREnv >> sustain [

	^ sustain ifNil: [
		sustain := PhHSlider new
			           label: self label , 'Sustain'
			           init: 0.5
			           min: 0
			           max: 1
			           step: 0.001 ]
]

{ #category : 'accessing' }
ADSREnv >> sustain: aNumberOrABox [

sustain := aNumberOrABox isNumber
		        ifTrue: [ self sustain init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]
]
