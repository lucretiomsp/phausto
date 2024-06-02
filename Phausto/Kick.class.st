"
Kick drum synthesis via a pitched sine sweep.

Where:

pitch: the base frequency of the kick drum in Hz
click: the speed of the pitch envelope, tuned for [0.005s, 1s]
attack: attack time in seconds, tuned for [0.005s, 0.4s]
decay: decay time in seconds, tuned for [0.005s, 4.0s]
drive: a gain multiplier going into the saturator. Tuned for [1, 10]
gate: the gate which triggers the amp envelope

"
Class {
	#name : #Kick,
	#superclass : #Synths,
	#instVars : [
		'pitch',
		'click',
		'attack',
		'decay',
		'drive',
		'gate'
	],
	#category : #'Phausto-BoxAPI-Synths'
}

{ #category : #converting }
Kick >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := pitch asBox , click asBox,  attack asBox , decay asBox , drive asBox, gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : #accessing }
Kick >> attack [

	^ attack
]

{ #category : #accessing }
Kick >> attack: aTimeInSeconds [ 

	attack := aTimeInSeconds asBox
]

{ #category : #accessing }
Kick >> click [

	^ click
]

{ #category : #accessing }
Kick >> click: aTimeInSeconds [

	click := aTimeInSeconds asBox.
]

{ #category : #accessing }
Kick >> decay [

	^ decay
]

{ #category : #accessing }
Kick >> decay: aTimeInSeconds [ 

	decay := aTimeInSeconds  asBox
]

{ #category : #accessing }
Kick >> drive [

	^ drive
]

{ #category : #accessing }
Kick >> drive: aNumber [

	drive := aNumber asBox.
]

{ #category : #accessing }
Kick >> gate [

	^ gate
]

{ #category : #accessing }
Kick >> gate: aTrigger [

	gate := aTrigger asBox.
]

{ #category : #initialization }
Kick >> initialize [
   
   super initialize .
self processExpression: 'process = sy.kick'.
	self pitch: 50.
	self click: 0.005s.
	self attack: 0.005.
	self decay: 0.315s.
	self drive: 3.
	self gate: 0
]

{ #category : #accessing }
Kick >> pitch [

	^ pitch
]

{ #category : #accessing }
Kick >> pitch: aFrequency [

	pitch := aFrequency  asBox
]
