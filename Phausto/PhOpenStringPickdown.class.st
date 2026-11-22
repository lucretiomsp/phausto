"
A bidirectional block implementing a ""generic"" string with selectable excitation position and stiffness. It also has a built-in pickup whose position can be independenly selected. The only constraint is that the pickup has to be placed before the excitation position.

## Parameters:
**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** pluck position on the string (0-1) (1 is bottom)
**pickupPosition: position of the pickup between the top of the string and the excitation position (0-1) (1 is excitation position)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenStringPickdown',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'length',
		'stiffness',
		'pluckPosition',
		'pickupPosition',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhOpenStringPickdown class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#stiffness -> 'the stiffness of the string (0-1) (1 for max stiffness)'.
			#pluckPosition -> 'pluck position on the string (0-1) (1 is bottom)'.
			#pickupPosition -> 'position of the pickup between the top of the string and the excitation position (0-1) (1 is excitation position)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhOpenStringPickdown class >> argumentNames [

	^ #( #length #stiffness #pluckPosition #pickupPosition #excitation )
]

{ #category : 'faust' }
PhOpenStringPickdown class >> faustName [

	^ 'openStringPickDown'
]

{ #category : 'accessing' }
PhOpenStringPickdown >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhOpenStringPickdown >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhOpenStringPickdown >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	stiffness := PhHSlider new
			label: self label , 'Stiffness'
			values: #( 0.5 0 1 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	pickupPosition := PhHSlider new
			label: self label , 'PickupPosition'
			values: #( 0.7 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhOpenStringPickdown >> length [

	^ length
]

{ #category : 'accessing' }
PhOpenStringPickdown >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickdown >> pickupPosition [

	^ pickupPosition
]

{ #category : 'accessing' }
PhOpenStringPickdown >> pickupPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickdown >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhOpenStringPickdown >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickdown >> stiffness [

	^ stiffness
]

{ #category : 'accessing' }
PhOpenStringPickdown >> stiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
