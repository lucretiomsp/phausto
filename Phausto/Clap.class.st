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
	#category : #'Phausto-BoxAPI-Synths'
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
Clap >> attack: aBoxorAFloat [

	attack := aBoxorAFloat asBox
]

{ #category : #accessing }
Clap >> decay [

	^ decay
]

{ #category : #accessing }
Clap >> decay: aBoxorAFloat [

	decay := aBoxorAFloat asBox
]

{ #category : #accessing }
Clap >> gate [

	^ gate
]

{ #category : #accessing }
Clap >> gate: aBoxorAFloat [

	gate := aBoxorAFloat asBox
]

{ #category : #initialization }
Clap >> initialize [

	super initialize.
	processExpression := 'process = sy.clap;'.
	tone := 1200.
	attack := 0.
	decay := 3.
	gate := PhHSlider new
		        label: self label , 'Gate'
		        init: 0
		        min: 0
		        max: 1
		        step: 1
]

{ #category : #accessing }
Clap >> tone [

	^ tone
]

{ #category : #accessing }
Clap >> tone: aBoxorAFloat [

	tone := aBoxorAFloat asBox
]
