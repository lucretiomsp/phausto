"
A simple acoustic guitar model with nylon strings (based on nylonGuitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.

## Parameters:

**length:** the length of the string in meters
**pluckPosition:** excitation position (0-1) (1 is bottom)
**excitation:** the excitation signal

"
Class {
	#name : 'PhNylonGuitar',
	#superclass : 'StringInstruments',
	#instVars : [
		'length',
		'pluckPosition',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhNylonGuitar class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#gain -> 'gain of the excitation (0-1)'.
			#trigger -> 'trigger signal (1 for on, 0 for off)' }
]

{ #category : 'faust' }
PhNylonGuitar class >> argumentNames [

	^ #( #length #pluckPosition #gain #trigger )
]

{ #category : 'faust' }
PhNylonGuitar class >> faustName [

	^ 'nylonGuitar'
]

{ #category : 'accessing' }
PhNylonGuitar >> gain [

	^ gain
]

{ #category : 'accessing' }
PhNylonGuitar >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhNylonGuitar >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhNylonGuitar >> length [

	^ length
]

{ #category : 'accessing' }
PhNylonGuitar >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhNylonGuitar >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhNylonGuitar >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhNylonGuitar >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhNylonGuitar >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
