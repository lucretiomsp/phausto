"
This library contains a collection of envelope generators from Faust envelopes.lib
All the envelopes have at least an attack time and a release time.
To be triggered they need to receive an input greater than 0

for example:
(Button new label: 'trigger' ) connectTo: AREnv new
"
Class {
	#name : #Envelope,
	#superclass : #UnitGenerator,
	#instVars : [
		'attack',
		'release',
		'trigger'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #accessing }
Envelope >> attack [

	^ attack
]

{ #category : #accessing }
Envelope >> attack: anObject [

	attack := anObject asBox
]

{ #category : #initialization }
Envelope >> initialize [

	super initialize.
	attack := PhHSlider new
		          label: self label , 'Attack'
		          init: 0.001
		          min: 0.001
		          max: 2
		          step: 1.
	release := PhHSlider new
		           label: self label , 'Release'
		           init: 0.3
		           min: 0.001
		           max: 3
		           step: 0.001.
	trigger := PhHSlider new
		           label: self label , 'Gate'
		           init: 0
		           min: 0
		           max: 1
		           step: 1
]

{ #category : #connecting }
Envelope >> patchedWith: aUnitGenerator [

aUnitGenerator asBox * self asBox.
]

{ #category : #accessing }
Envelope >> release [

	^ release
]

{ #category : #accessing }
Envelope >> release: anObject [

	release := anObject
]

{ #category : #accessing }
Envelope >> trigger [

	^ trigger
]

{ #category : #accessing }
Envelope >> trigger: anObject [

	trigger := anObject asBox
]
