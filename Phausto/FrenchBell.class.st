"
French church bell modal model.

Modeled after D.Bartocha and Baron, Influence of Tin Bronze Melting and Pouring Parameters on Its Properties and Bell' Tone, Archives of Foundry Engineering, 2016.

Model height is 1 m.

This model contains 7 excitation positions going linearly from the bottom to the top of the bell.
"
Class {
	#name : #FrenchBell,
	#superclass : #ModalPercussion,
	#instVars : [
		'strikeCutoff'
	],
	#category : #'Phausto-PhysicalModels'
}

{ #category : #converting }
FrenchBell >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.

	finalBox := 
	strikePosition , strikeCutoff , strikeSharpness , gain
	, trigger connectTo: intermediateBox.

	^ finalBox
]

{ #category : #initialization }
FrenchBell >> initialize [

	super initialize.
	processExpression := 'process = pm.frenchBell;'.
	self freq: 440.
	self strikePosition: 6.
	self strikeCutoff: 7000.
	self strikeSharpness: 0.26.
	self gain: 0.8.
	self trigger: 0.0
]

{ #category : #accessing }
FrenchBell >> strikeCutoff [

	^ strikeCutoff
]

{ #category : #accessing }
FrenchBell >> strikeCutoff: anObject [

	strikeCutoff := anObject
]
