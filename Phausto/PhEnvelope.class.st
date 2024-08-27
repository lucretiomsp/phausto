"
I am the superclass for all Phausto envelopes.
In sound and music, an envelope describes how a sound changes over time.
The envelope generator was created by tHerbert Deutsch for Robert Moog, the creator of the Moog synthesizer, in the 1960s.
"
Class {
	#name : 'PhEnvelope',
	#superclass : 'UnitGenerator',
	#instVars : [
		'attack',
		'release',
		'trigger'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
PhEnvelope >> attack [

	^ attack ifNil: [
		attack := PhHSlider new
			          label: self label , 'Attack'
			          init: 0.001
			          min: 0.001
			          max: 2
			          step: 1 ].
]

{ #category : 'accessing' }
PhEnvelope >> attack: aNumberOrABox [

	attack := aNumberOrABox isNumber
		        ifTrue: [ self attack init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]
]

{ #category : 'initialization' }
PhEnvelope >> initialize [

	super initialize.
	
]

{ #category : 'connecting' }
PhEnvelope >> patchedWith: aUnitGenerator [


	^ aUnitGenerator asBox * self asBox
]

{ #category : 'dependencies' }
PhEnvelope >> release [

	^ release ifNil: [
		release := PhHSlider new
			           label: self label , 'Release'
			           init: 0.3
			           min: 0.001
			           max: 3
			           step: 0.001 ].
]

{ #category : 'accessing' }
PhEnvelope >> release: aNumberOrABox [


	release := aNumberOrABox isNumber
		        ifTrue: [ self release init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]
]

{ #category : 'accessing' }
PhEnvelope >> trigger [

	^ trigger  ifNil: [
		trigger := PhButton new label: self label , 'Gate' ]
]

{ #category : 'accessing' }
PhEnvelope >> trigger: aNumberOrABox [

	aNumberOrABox isNumber
		        ifTrue: [ self trigger init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]
]
