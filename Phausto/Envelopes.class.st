"
This library contains a collection of envelope generators from Faust envelopes.lib
All the envelopes have at least an attack time and a release time.
To be triggered they need to receive an input greater than 0

for example:
(Button new label: 'trigger' ) connectTo: AREnv new
"
Class {
	#name : #Envelopes,
	#superclass : #UnitGenerators,
	#instVars : [
		'attack',
		'release',
		'trigger'
	],
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #accessing }
Envelopes >> attack [

	^ attack
]

{ #category : #accessing }
Envelopes >> attack: anObject [

	attack := anObject asBox
]

{ #category : #initialization }
Envelopes >> initialize [

	super initialize.
	attack := 0.001 .
	release := 0.2 .
	trigger := 0 
]

{ #category : #accessing }
Envelopes >> release [

	^ release
]

{ #category : #accessing }
Envelopes >> release: anObject [

	release := anObject
]

{ #category : #accessing }
Envelopes >> trigger [

	^ trigger
]

{ #category : #accessing }
Envelopes >> trigger: anObject [

	trigger := anObject asBox
]
