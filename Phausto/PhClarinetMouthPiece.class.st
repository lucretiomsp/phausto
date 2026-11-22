"
Bidirectional block implementing a clarinet mouthpiece as well as the various interactions happening with traveling waves. This element is ready to be plugged to a tube.
##Parameters:

**pressure:** the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
**reedStiffness:** reed stiffness (0-1)
"
Class {
	#name : 'PhClarinetMouthPiece',
	#superclass : 'PhPmElement',
	#instVars : [
		'reedStiffness',
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhClarinetMouthPiece class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#reedStiffness -> 'reed stiffness (0-1)'.
			#pressure -> 'the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhClarinetMouthPiece class >> argumentNames [

	^ #( #reedStiffness #pressure )
]

{ #category : 'faust' }
PhClarinetMouthPiece class >> faustName [

	^ 'clarinetMouthPiece'
]

{ #category : 'initialization' }
PhClarinetMouthPiece >> initializeArguments [

	reedStiffness := PhHSlider new
			label: self label , 'ReedStiffness'
			values: #( 0.5 0 1 0.01 ).
	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> reedStiffness [

	^ reedStiffness
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> reedStiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
