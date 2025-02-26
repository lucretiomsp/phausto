"
I am the superclass for all Phausto envelopes.
In sound and music, an envelope describes how a sound changes over time.
The envelope generator was created by [Herbert Deutsch](https://en.wikipedia.org/wiki/Herbert_Deutsch) for [Robert Moog](https://en.wikipedia.org/wiki/Robert_Moog), the creator of the Moog synthesizer, in the 1960s.
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
			             step: 0.001
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
