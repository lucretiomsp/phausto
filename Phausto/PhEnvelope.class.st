"
I am the superclass for all Phausto envelopes.
In sound and music, an envelope describes how a sound changes over time.
The envelope generator was developed by [Robert Moog](https://en.wikipedia.org/wiki/Robert_Moog) in the 1960s, with significant input and inspiration from his collaborator, [Herbert Deutsch](https://en.wikipedia.org/wiki/Herbert_Deutsch)
**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
"
Class {
	#name : 'PhEnvelope',
	#superclass : 'UnitGenerator',
	#instVars : [
		'attack',
		'release',
		'trigger'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'accessing' }
PhEnvelope >> attack [

	^ attack 
]

{ #category : 'initialization' }
PhEnvelope >> initialize [

	super initialize.
	super initializeControlParameters .
	attack := PhHSlider new
		          label: self label , 'Attack'
		          init: 0.01
		          min: 0
		          max: 4
		          step: 0.001.
	release := PhHSlider new
		           label: self label , 'Release'
		           init: 0.1
		           min: 0.001
		           max: 2
		           step: 0.001.
	trigger := PhButton new label: self label , 'Trigger'.

	self controlParameters add: #trigger -> (self trigger
			 asControlParameterOfWidgetType: #button
			 description: 'Trig Envelopes').
]

{ #category : 'connecting' }
PhEnvelope >> patchedWith: aUnitGenerator [

	
	^ aUnitGenerator "asBox" * self asBox
]

{ #category : 'dependencies' }
PhEnvelope >> release [

	^ release 
]

{ #category : 'accessing' }
PhEnvelope >> trigger [

	^ trigger  ifNil: [
		trigger := PhButton new label: self label , 'Gate' ]
]
