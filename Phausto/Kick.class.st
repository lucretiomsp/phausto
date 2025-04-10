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
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
Kick >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self pitch asBox * 0.25 asBox , self click asBox
	            , self attack asBox , self decay asBox , self drive asBox
	            , self gate asBox connectTo: intermediateBox.
	^ finalBox * self uLevel.
]

{ #category : 'accessing' }
Kick >> attack [

	^ attack
]

{ #category : 'accessing' }
Kick >> click [

	^ click
]

{ #category : 'accessing' }
Kick >> decay [

	^ decay ifNil: [ decay:= (PhHSlider new
			 label: self label , 'Decay'
			 init: 2
			 min: 0.1
			 max: 2
			 step: 0.01). ]
]

{ #category : 'accessing' }
Kick >> decay: aNumberOrABoxOraASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOraASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'accessing' }
Kick >> drive [

	^ drive 
]

{ #category : 'accessing' }
Kick >> gate [

	^ gate 
]

{ #category : 'initialization' }
Kick >> initialize [

	super initialize.
	self processExpression: 'process = sy.kick;'.

	click := 0.116.
	attack := 0.005.
	self uLevel: 0.8.
	pitch := PhHSlider new
		         label: self label , 'Note'
		         init: 220
		         min: 20
		         max: 1400
		         step: 0.1.
	gate := PhButton new label: self label , 'Gate'.
	drive := PhHSlider new
		         label: self label , 'Drive'
		         init: 1
		         min: 1
		         max: 5
		         step: 0.001.
	self uLevel: 0.35
]

{ #category : 'accessing' }
Kick >> note [

	^ note
]

{ #category : 'accessing' }
Kick >> pitch [

	^ pitch 
]
