"
Simple marimba physical model implementing a single tone bar connected to tube.
The marimba is a musical instrument in the percussion family that consists of wooden bars that are struck by mallets. Below each bar is a resonator pipe that amplifies particular harmonics of its sound.
The term is of Bantu origin, deriving from the prefix ma- meaning 'many' and -rimba meaning 'xylophone'.
(from Wikipedia) 
"
Class {
	#name : 'Marimba',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Marimba >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self freq , self strikePosition , self strikeCutoff , self  strikeSharpness
	            , self gain , self trigger connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
Marimba >> initialize [

	super initialize.
	processExpression := 'process = pm.marimba;'.
	
]

{ #category : 'accessing' }
Marimba >> strikePosition [

	^ strikePosition ifNil: [ 
		self strikePosition: (PhHSlider new
			 label: self label , 'StrikePos'
			 init: 0
			 min: 0
			 max: 4
			 step: 1). ]
]
