"
Simple marimba physical model implementing a single tone bar connected to tube.
The marimba is a musical instrument in the percussion family that consists of wooden bars that are struck by mallets. Below each bar is a resonator pipe that amplifies particular harmonics of its sound.
The term is of Bantu origin, deriving from the prefix ma- meaning 'many' and -rimba meaning 'xylophone'.
(from Wikipedia) 
"
Class {
	#name : 'Marimba',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
Marimba >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self freq asBox , self strikePosition asBox , self strikeCutoff asBox 
	            , self strikeSharpness asBox , self gain asBox , self trigger asBox 
		            connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
Marimba >> initialize [

	super initialize.
	processExpression := 'process = pm.marimba;'.
	
]
