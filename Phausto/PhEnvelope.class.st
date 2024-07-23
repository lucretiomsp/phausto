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
