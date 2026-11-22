"
A simple acoustic guitar model with nylon strings and selectable excitation position. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string and not through a finger model. WARNING: this function doesn't currently implement a body (just strings and bridge).
## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhNylonGuitarModel',
	#superclass : 'StringInstruments',
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
PhNylonGuitarModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#excitation -> 'excitation signal' }
]

{ #category : 'faust' }
PhNylonGuitarModel class >> argumentNames [

	^ #( #length #pluckPosition #excitation )
]

{ #category : 'faust' }
PhNylonGuitarModel class >> faustName [

	^ 'nylonGuitarModel'
]

{ #category : 'accessing' }
PhNylonGuitarModel >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhNylonGuitarModel >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhNylonGuitarModel >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhNylonGuitarModel >> length [

	^ length
]

{ #category : 'accessing' }
PhNylonGuitarModel >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhNylonGuitarModel >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhNylonGuitarModel >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
