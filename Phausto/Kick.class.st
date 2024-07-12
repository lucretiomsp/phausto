"
Kick drum synthesis via a pitched sine sweep.
Incoming MIDI NoteNumber are lowered by two octaves, so 60 plays a low kick.

Where:

pitch: the base frequency of the kick drum in Hz
click: the speed of the pitch envelope, tuned for [0.005s, 1s]
attack: attack time in seconds, tuned for [0.005s, 0.4s]
decay: decay time in seconds, tuned for [0.005s, 4.0s]
drive: a gain multiplier going into the saturator. Tuned for [1, 10]
gate: the gate which triggers the amp envelope

"
Class {
	#name : 'Kick',
	#superclass : 'Synths',
	#instVars : [
		'pitch',
		'click',
		'attack',
		'decay',
		'drive',
		'gate',
		'note'
	],
	#category : 'Phausto-BoxAPI-Synths',
	#package : 'Phausto',
	#tag : 'BoxAPI-Synths'
}

{ #category : 'converting' }
Kick >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self pitch asBox * 0.25 asBox , self click asBox , self attack asBox
	            , self decay asBox , self drive asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
Kick >> attack [

	^ attack
]

{ #category : 'accessing' }
Kick >> attack: aTimeInSeconds [ 

	attack := aTimeInSeconds asBox
]

{ #category : 'accessing' }
Kick >> click [

	^ click
]

{ #category : 'accessing' }
Kick >> click: aTimeInSeconds [

	click := aTimeInSeconds asBox.
]

{ #category : 'accessing' }
Kick >> decay [

	^ decay
]

{ #category : 'accessing' }
Kick >> decay: aTimeInSeconds [ 

	decay := aTimeInSeconds  asBox
]

{ #category : 'accessing' }
Kick >> drive [

	^ drive
]

{ #category : 'accessing' }
Kick >> drive: aNumber [

	drive := aNumber asBox.
]

{ #category : 'accessing' }
Kick >> gate [

	^ gate
]

{ #category : 'accessing' }
Kick >> gate: aTrigger [

	gate := aTrigger asBox.
]

{ #category : 'initialization' }
Kick >> initialize [

	super initialize.
	self processExpression: 'process = sy.kick;'.
	self note: 50.
	self click: 0.116.
	self attack: 0.005.
	self decay: (PhHSlider new
			 label: self label , 'Decay'
			 init: 2
			 min: 0.1
			 max: 2
			 step: 0.01).
	self drive: (PhHSlider new
			 label: self label , 'Drive'
			 init: 1
			 min: 1
			 max: 5
			 step: 0.001).
	self gate: (PhHSlider new
			 label: self label , 'Gate'
			 init: 0
			 min: 0
			 max: 1
			 step: 1).
	self pitch: (PhHSlider new
			 label: self label , 'Note'
			 init: 60
			 min: 0
			 max: 128
			 step: 0.1).
	self uLevel: 0.4
]

{ #category : 'accessing' }
Kick >> note [

	^ note
]

{ #category : 'accessing' }
Kick >> note: aNoteNumber [

	note := aNoteNumber asBox.
]

{ #category : 'accessing' }
Kick >> pitch [

	^ pitch
]

{ #category : 'accessing' }
Kick >> pitch: aFrequency [

	pitch := aFrequency  asBox
]
