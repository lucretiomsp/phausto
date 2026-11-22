"
A bidirectional block implementing a basic nylon string with selectable excitation position. This element is based on openString and has a fix stiffness corresponding to that of a nylon string.
## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhNylonString',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'length',
		'pluckPosition',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhNylonString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'excitation position (0-1) (1 is bottom)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhNylonString class >> argumentNames [

	^ #( #length #pluckPosition #excitation )
]

{ #category : 'faust' }
PhNylonString class >> faustName [

	^ 'nylonString'
]

{ #category : 'accessing' }
PhNylonString >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhNylonString >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhNylonString >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhNylonString >> length [

	^ length
]

{ #category : 'accessing' }
PhNylonString >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhNylonString >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhNylonString >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
