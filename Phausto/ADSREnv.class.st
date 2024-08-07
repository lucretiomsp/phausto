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
	#name : #ADSREnv,
	#superclass : #PhEnvelope,
	#instVars : [
		'decay',
		'sustain'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
ADSREnv >> asBox [

	| intermediateBox finalBox |
	self initializeUIParameters .
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox , self sustain asBox
	            , self release asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : #accessing }
ADSREnv >> decay [

	^ decay
]

{ #category : #accessing }
ADSREnv >> decay: aNumberOrABox [

	aNumberOrABox isNumber
		ifTrue: [ self decay  init: aNumberOrABox ]
		ifFalse: [ decay := aNumberOrABox ]
]

{ #category : #initialization }
ADSREnv >> initialize [

	super initialize.
	self decay: 0.2.
	self sustain: 0.5.
	processExpression := 'process = en.adsr;'
]

{ #category : #initialization }
ADSREnv >> initializeUIParameters [

	super initializeUIParameters.
	self decay ifNil: [decay := PhHSlider new
		         label: self label , 'Decay'
		         init: 0.001
		         min: 0.001
		         max: 2
		         step: 1.].
	self sustain ifNil: [sustain := PhHSlider new
		           label: self label , 'Sustain'
		           init: 0.5
		           min: 0
		           max: 1
		           step: 0.001]
]

{ #category : #accessing }
ADSREnv >> sustain [

	^ sustain
]

{ #category : #accessing }
ADSREnv >> sustain: aNumberOrABox [

	aNumberOrABox isNumber
		ifTrue: [ self sustain init: aNumberOrABox ]
		ifFalse: [ sustain := aNumberOrABox ]
]
