"
A bidirectional block implementing a basic steel string with selectable excitation position. This element is based on openString and has a fix stiffness corresponding to that of a steel string.

## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhSteelString',
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
PhSteelString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'excitation position (0-1) (1 is bottom)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhSteelString class >> argumentNames [

	^ #( #length #pluckPosition #excitation )
]

{ #category : 'faust' }
PhSteelString class >> faustName [

	^ 'steelString'
]

{ #category : 'accessing' }
PhSteelString >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhSteelString >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhSteelString >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhSteelString >> length [

	^ length
]

{ #category : 'accessing' }
PhSteelString >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhSteelString >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhSteelString >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
