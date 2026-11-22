"
A bidirectional block implementing a ""generic"" string with selectable excitation position. It also has a built-in pickup whose position is the same as the excitation position. Thus, moving the excitation position will also move the pickup.

## Parameters

**length:** the length of the string in meters
**stiffness:** the stiffness of the string (0-1) (1 for max stiffness)
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal
"
Class {
	#name : 'PhOpenStringPickup',
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
PhOpenStringPickup class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#stiffness -> 'the stiffness of the string (0-1) (1 for max stiffness)'.
			#pluckPosition -> 'pluck position between the top of the string and the pickup (0-1) (1 for same as pickup position)'.
			#pickupPosition -> 'position of the pickup on the string (0-1) (1 is bottom)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhOpenStringPickup class >> argumentNames [

	^ #( #length #stiffness #pluckPosition #pickupPosition #excitation )
]

{ #category : 'faust' }
PhOpenStringPickup class >> faustName [

	^ 'openStringPickUp'
]

{ #category : 'accessing' }
PhOpenStringPickup >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhOpenStringPickup >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhOpenStringPickup >> initializeArguments [

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
PhOpenStringPickup >> length [

	^ length
]

{ #category : 'accessing' }
PhOpenStringPickup >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickup >> pickupPosition [

	^ pickupPosition
]

{ #category : 'accessing' }
PhOpenStringPickup >> pickupPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickup >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhOpenStringPickup >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPickup >> stiffness [

	^ stiffness
]

{ #category : 'accessing' }
PhOpenStringPickup >> stiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
