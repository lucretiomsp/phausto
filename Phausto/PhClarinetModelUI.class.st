"
Same as clarinetModel but with a built-in UI. This function doesn't implement a virtual ""blower"", thus `pressure` remains an argument here.

Faust: `pm.clarinetModel_ui(pressure)` (0 in / 1 out)

## Parameters

- **pressure**: the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will be directly injected in the mouthpiece (e.g., breath noise, etc.).

## Example

```language=Pharo
dsp := PhClarinetModelUI new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhClarinetModelUI',
	#superclass : 'WindInstruments',
	#instVars : [
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhClarinetModelUI class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#pressure -> 'the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will be directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhClarinetModelUI class >> argumentNames [

	^ #( #pressure )
]

{ #category : 'faust' }
PhClarinetModelUI class >> faustName [

	^ 'clarinetModel_ui'
]

{ #category : 'initialization' }
PhClarinetModelUI >> initializeArguments [

	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhClarinetModelUI >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhClarinetModelUI >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
