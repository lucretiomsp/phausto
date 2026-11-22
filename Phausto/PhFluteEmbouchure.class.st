"
Bidirectional block implementing a flute embouchure as well as the various interactions happening with traveling waves. This element is ready to be plugged between tubes segments...

Faust: `pm.fluteEmbouchure(pressure)` (3 in / 3 out)

## Parameters

- **pressure**: the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).

## Example

```language=Pharo
(PhLStringRigidTermination new => PhFluteEmbouchure new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhFluteEmbouchure',
	#superclass : 'PhPmElement',
	#instVars : [
		'pressure'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhFluteEmbouchure class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#pressure -> 'the pressure of the air flow (DC) created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).' }
]

{ #category : 'faust' }
PhFluteEmbouchure class >> argumentNames [

	^ #( #pressure )
]

{ #category : 'faust' }
PhFluteEmbouchure class >> faustName [

	^ 'fluteEmbouchure'
]

{ #category : 'initialization' }
PhFluteEmbouchure >> initializeArguments [

	pressure := PhHSlider new
			label: self label , 'Pressure'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhFluteEmbouchure >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhFluteEmbouchure >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
