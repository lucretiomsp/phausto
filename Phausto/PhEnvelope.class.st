"
I am the superclass for all Phausto envelopes.
In sound and music, an envelope describes how a sound changes over time.
The envelope generator was created by tHerbert Deutsch for Robert Moog, the creator of the Moog synthesizer, in the 1960s.
"
Class {
	#name : #PhEnvelope,
	#superclass : #UnitGenerator,
	#instVars : [
		'attack',
		'release',
		'trigger'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #accessing }
PhEnvelope >> attack [

	^ attack
]

{ #category : #accessing }
PhEnvelope >> attack: anObject [

	attack := anObject asBox
]

{ #category : #initialization }
PhEnvelope >> initialize [

	super initialize.
	
]

{ #category : #initialization }
PhEnvelope >> initializeUIParameters [ 

	super initializeUIParameters .
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
PhEnvelope >> patchedWith: aUnitGenerator [

^ aUnitGenerator asBox * self asBox
]

{ #category : #dependencies }
PhEnvelope >> release [ 
^ release 
]

{ #category : #accessing }
PhEnvelope >> release: anObject [

	release := anObject asBox
]

{ #category : #accessing }
PhEnvelope >> trigger [

	^ trigger
]

{ #category : #accessing }
PhEnvelope >> trigger: anObject [

	trigger := anObject asBox
]
