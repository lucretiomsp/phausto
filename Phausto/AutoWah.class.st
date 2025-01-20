"
Auto-wah effect from Faust Virtual Analog Effect Library, where level is amount of effect desired (0 to 1).

Wah-wah (or wa-wa) is an imitative word for the sound of altering the resonance of musical notes to extend expressiveness, sounding much like a human voice saying the syllable wah. The wah-wah effect is a spectral glide, a ""modification of the vowel quality of a tone
"
Class {
	#name : 'AutoWah',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
AutoWah >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input, self level
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
AutoWah >> initialize [

	super initialize.
	processExpression :='process = ve.autowah;'.
	self input: 0.
	self level: 0.
]

{ #category : 'accessing' }
AutoWah >> input [

	^ input
]

{ #category : 'as yet unclassified' }
AutoWah >> input: anInput [

	input := anInput asBox
]

{ #category : 'as yet unclassified' }
AutoWah >> level [

	^ level
]

{ #category : 'as yet unclassified' }
AutoWah >> level: aLevel [

	level := aLevel asBox
]

{ #category : 'as yet unclassified' }
AutoWah >> patchedWith: aBox [
self input: aBox
]
