"
A bidirectional block implementing a basic ""generic"" string with a selectable excitation position. Lowpass filters are built-in and allow to simulate the effect of dispersion on the sound and thus to change the ""stiffness"" of the string.

## Parameters: 

**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenString',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'length',
		'stiffness',
		'pluckPosition',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhOpenString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#stiffness -> 'the stiffness of the string (0-1) (1 for max stiffness)'.
			#pluckPosition -> 'excitation position (0-1) (1 is bottom)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhOpenString class >> argumentNames [

	^ #( #length #stiffness #pluckPosition #excitation )
]

{ #category : 'faust' }
PhOpenString class >> faustName [

	^ 'openString'
]

{ #category : 'accessing' }
PhOpenString >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhOpenString >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhOpenString >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	stiffness := PhHSlider new
			label: self label , 'Stiffness'
			values: #( 0.5 0 1 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhOpenString >> length [

	^ length
]

{ #category : 'accessing' }
PhOpenString >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenString >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhOpenString >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenString >> stiffness [

	^ stiffness
]

{ #category : 'accessing' }
PhOpenString >> stiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
