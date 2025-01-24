"
The Dunlop Cry Baby is a popular wah-wah pedal, manufactured by Dunlop Manufacturing, Inc. The name Cry Baby was from the original pedal from which it was copied, the Thomas Organ/Vox Cry Baby wah-wah, first manufactured in 1966.[1] Thomas Organ/Vox failed to register the name as a trademark, leaving it open for Dunlop. More recently, Dunlop manufactured the Vox pedals under licence, although this is no longer the case.
"
Class {
	#name : 'CryBaby_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
CryBaby_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
CryBaby_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
