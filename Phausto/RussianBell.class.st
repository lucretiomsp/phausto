"
French church bell modal model.

Modeled after D.Bartocha and Baron, Influence of Tin Bronze Melting and Pouring Parameters on Its Properties and Bell' Tone, Archives of Foundry Engineering, 2016.

Model height is 1 m.

This model contains 7 excitation positions going linearly from the bottom to the top of the bell.
"
Class {
	#name : 'RussianBell',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
RussianBell >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self strikePosition asBox , self strikeCutoff asBox
	            , self strikeSharpness asBox , self gain asBox
	            , self trigger asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
RussianBell >> initialize [

	super initialize.
	processExpression := 'process = pm.russianBell;'
]
