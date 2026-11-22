"
A simple generic brass instrument physical model without pistons (pitch is changed by changing the length of the tube of the instrument). This model is kind of hard to control and might not sound very good if bad parameters are given to it...

Faust: `pm.brassModel(tubeLength, lipsTension, mute, pressure)` (0 in / 1 out)

## Parameters

- **tubeLength**: the length of the tube in meters
- **lipsTension**: tension of the lips (0-1) (default: 0.5)
- **mute**: mute opening at the end of the instrument (0-1) (default: 0.5)
- **pressure**: the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).

## Example

```language=Pharo
dsp := PhBrassModel new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhBrassModel',
	#superclass : 'WindInstruments',
	#instVars : [
		'tubeLength',
		'lipsTension',
		'mute',
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhBrassModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'the length of the tube in meters'.
			#lipsTension -> 'tension of the lips (0-1) (default: 0.5)'.
			#mute -> 'mute opening at the end of the instrument (0-1) (default: 0.5)'.
			#pressure -> 'the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhBrassModel class >> argumentNames [

	^ #( #tubeLength #lipsTension #mute #pressure )
]

{ #category : 'faust' }
PhBrassModel class >> faustName [

	^ 'brassModel'
]

{ #category : 'initialization' }
PhBrassModel >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.01 2.5 0.01 ).
	lipsTension := PhHSlider new
			label: self label , 'LipsTension'
			values: #( 0.5 0 1 0.01 ).
	mute := PhHSlider new
			label: self label , 'Mute'
			values: #( 0.5 0 1 0.01 ).
	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhBrassModel >> lipsTension [

	^ lipsTension
]

{ #category : 'accessing' }
PhBrassModel >> lipsTension: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassModel >> mute [

	^ mute
]

{ #category : 'accessing' }
PhBrassModel >> mute: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassModel >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhBrassModel >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassModel >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
PhBrassModel >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
