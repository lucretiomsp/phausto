"
French church bell modal model.

Modeled after D.Bartocha and Baron, Influence of Tin Bronze Melting and Pouring Parameters on Its Properties and Bell' Tone, Archives of Foundry Engineering, 2016.

Model height is 1 m.

This model contains 7 excitation positions going linearly from the bottom to the top of the bell.
"
Class {
	#name : 'GermanBell',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
GermanBell >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self strikePosition , self strikeCutoff , self strikeSharpness , self gain
	            , self trigger connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
GermanBell >> initialize [

	super initialize.
	processExpression := 'process = pm.germanBell;'
]
