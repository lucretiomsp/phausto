"
A simple electric guitar model (without audio effects, of course) with selectable pluck position. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function. Pitch is changed by changing the length of the string and not through a finger model.

Faust: `pm.elecGuitarModel(length, pluckPosition, mute, excitation)` (0 in / 1 out)

## Parameters

- **length**: the length of the string in meters
- **pluckPosition**: pluck position (0-1) (1 is on the bridge)
- **mute**: mute coefficient (1 for no mute and 0 for instant mute)
- **excitation**: excitation signal

## Example

```language=Pharo
dsp := PhElecGuitarModel new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhElecGuitarModel',
	#superclass : 'StringInstruments',
	#instVars : [
		'length',
		'pluckPosition',
		'mute',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhElecGuitarModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#mute -> 'mute coefficient (1 for no mute and 0 for instant mute)'.
			#excitation -> 'excitation signal' }
]

{ #category : 'faust' }
PhElecGuitarModel class >> argumentNames [

	^ #( #length #pluckPosition #mute #excitation )
]

{ #category : 'faust' }
PhElecGuitarModel class >> faustName [

	^ 'elecGuitarModel'
]

{ #category : 'accessing' }
PhElecGuitarModel >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhElecGuitarModel >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhElecGuitarModel >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	mute := PhHSlider new
			label: self label , 'Mute'
			values: #( 1 0 1 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhElecGuitarModel >> length [

	^ length
]

{ #category : 'accessing' }
PhElecGuitarModel >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhElecGuitarModel >> mute [

	^ mute
]

{ #category : 'accessing' }
PhElecGuitarModel >> mute: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhElecGuitarModel >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhElecGuitarModel >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
