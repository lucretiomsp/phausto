"
Clap synthesis with filtered noise
"
Class {
	#name : #Clap,
	#superclass : #Synths,
	#instVars : [
		'tone',
		'attack',
		'decay',
		'gate'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
Clap >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := tone asBox , attack asBox , decay asBox , gate asBox
		            connectTo: intermediateBox.
	^ finalBox 
]

{ #category : #accessing }
Clap >> attack [

	^ attack
]

{ #category : #accessing }
Clap >> attack: anObject [

	attack := anObject
]

{ #category : #accessing }
Clap >> decay [

	^ decay
]

{ #category : #accessing }
Clap >> decay: anObject [

	decay := anObject
]

{ #category : #accessing }
Clap >> gate [

	^ gate
]

{ #category : #accessing }
Clap >> gate: anObject [

	gate := anObject
]

{ #category : #initialization }
Clap >> initialize [

	
	super initialize.
	code := self importStatement  , 'process = sy.clap;'.
	tone := 1200.
	attack := 0.
	decay := 3.
	gate := 0
]

{ #category : #accessing }
Clap >> tone [

	^ tone
]

{ #category : #accessing }
Clap >> tone: anObject [

	tone := anObject
]
