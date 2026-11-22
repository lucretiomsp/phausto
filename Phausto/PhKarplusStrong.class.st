"
A Karplus-Strong string (in that case, the string is implemented as a one dimension waveguide).

## Parameters: 
**length:** the length of the string in meters
**damping:** string damping (0-1)
**excitation:** excitation signal
"
Class {
	#name : 'PhKarplusStrong',
	#superclass : 'StringInstruments',
	#instVars : [
		'length',
		'damping',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhKarplusStrong class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#damping -> 'string damping (0-1)'.
			#excitation -> 'excitation signal' }
]

{ #category : 'faust' }
PhKarplusStrong class >> argumentNames [

	^ #( #length #damping #excitation )
]

{ #category : 'faust' }
PhKarplusStrong class >> faustName [

	^ 'ks'
]

{ #category : 'accessing' }
PhKarplusStrong >> damping [

	^ damping
]

{ #category : 'accessing' }
PhKarplusStrong >> damping: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhKarplusStrong >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhKarplusStrong >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhKarplusStrong >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	damping := PhHSlider new
			label: self label , 'Damping'
			values: #( 0.3 0 1 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhKarplusStrong >> length [

	^ length
]

{ #category : 'accessing' }
PhKarplusStrong >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
