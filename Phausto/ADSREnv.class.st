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
	#superclass : #Envelopes,
	#instVars : [
		'decay',
		'sustain'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
ADSREnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self decay asBox, self sustain asBox , self release asBox
	            , self trigger asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : #accessing }
ADSREnv >> decay [

	^ decay
]

{ #category : #accessing }
ADSREnv >> decay: anObject [

	decay := anObject
]

{ #category : #initialization }
ADSREnv >> initialize [

	super initialize.
	self decay: 0.2.
	self sustain: 0.5.
	processExpression := 'process = en.adsr;'
]

{ #category : #accessing }
ADSREnv >> sustain [

	^ sustain
]

{ #category : #accessing }
ADSREnv >> sustain: anObject [

	sustain := anObject
]
