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
	#category : #'Phausto-UnitGenerators'
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
	attack := PhHSlider new
		          label: self label , 'Attack'
		          init: 0.001
		          min: 0.001
		          max: 2
		          step: 1.
	release := PhHSlider new
		          label: self label , 'Attack'
		          init: 0.001
		          min: 0.001
		          max: 2
		          step: 1.
	trigger := PhHSlider new
		           label: self label , 'Release'
		           init: 0.2
		           min: 0
		           max: 3
		           step: 0.001
]

{ #category : #connecting }
Envelopes >> patchedWith: aUnitGenerator [

aUnitGenerator asBox * self asBox.
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
