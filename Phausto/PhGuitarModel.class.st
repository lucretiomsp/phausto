"
A simple acoustic guitar model with steel strings and selectable excitation position. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string and not through a finger model. WARNING: this function doesn't currently implement a body (just strings and bridge).

Faust: `pm.guitarModel(length, pluckPosition, excitation)` (0 in / 1 out)

## Parameters

- **length**: the length of the string in meters
- **pluckPosition**: pluck position (0-1) (1 is on the bridge)
- **excitation**: excitation signal

## Example

```language=Pharo
dsp := PhGuitarModel new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhGuitarModel',
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
PhGuitarModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#excitation -> 'excitation signal' }
]

{ #category : 'faust' }
PhGuitarModel class >> argumentNames [

	^ #( #length #pluckPosition #excitation )
]

{ #category : 'faust' }
PhGuitarModel class >> faustName [

	^ 'guitarModel'
]

{ #category : 'accessing' }
PhGuitarModel >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhGuitarModel >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhGuitarModel >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhGuitarModel >> length [

	^ length
]

{ #category : 'accessing' }
PhGuitarModel >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhGuitarModel >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhGuitarModel >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
