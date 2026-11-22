"
Bidirectional block implementing a brass mouthpiece as well as the various interactions happening with traveling waves. This element is ready to be plugged to a tube...

Faust: `pm.brassLips(tubeLength, lipsTension, pressure)` (3 in / 3 out)

## Parameters

- **tubeLength**: length in meters of the tube connected to the mouthpiece
- **lipsTension**: tension of the lips (0-1) (default: 0.5)
- **pressure**: the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).

## Example

```language=Pharo
(PhLStringRigidTermination new => PhBrassLips new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhBrassLips',
	#superclass : 'PhPmElement',
	#instVars : [
		'tubeLength',
		'lipsTension',
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhBrassLips class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'length in meters of the tube connected to the mouthpiece'.
			#lipsTension -> 'tension of the lips (0-1) (default: 0.5)'.
			#pressure -> 'the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhBrassLips class >> argumentNames [

	^ #( #tubeLength #lipsTension #pressure )
]

{ #category : 'faust' }
PhBrassLips class >> faustName [

	^ 'brassLips'
]

{ #category : 'initialization' }
PhBrassLips >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.01 2.5 0.01 ).
	lipsTension := PhHSlider new
			label: self label , 'LipsTension'
			values: #( 0.5 0 1 0.01 ).
	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhBrassLips >> lipsTension [

	^ lipsTension
]

{ #category : 'accessing' }
PhBrassLips >> lipsTension: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassLips >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhBrassLips >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassLips >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
PhBrassLips >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
