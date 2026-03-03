"
Bidirectional block implementing a clarinet mouthpiece as well as the various interactions happening with traveling waves. This element is ready to be plugged to a tube.
##Parameters:

**pressure:** the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
**reedStiffness:** reed stiffness (0-1)
"
Class {
	#name : 'PhClarinetMouthPiece',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pressure',
		'stiffness'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'converting' }
PhClarinetMouthPiece >> asBox [ 

^ self pressure , self stiffness connectTo: self code asBox
]

{ #category : 'initialization' }
PhClarinetMouthPiece >> initialize [

	super initialize.
	processExpression := 'process = pm.clarinetMouthPiece;'.
	pressure := (self label , 'Pressure') asSymbol asPhHSlider .
	stiffness := (self label , 'Stiffness') asSymbol asPhHSlider .
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> pressure [ 
^ pressure
]

{ #category : 'accessing' }
PhClarinetMouthPiece >> stiffness [ 
^ stiffness
]
