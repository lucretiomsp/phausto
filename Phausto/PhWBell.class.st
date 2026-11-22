"
Generic wind instrument bell bidirectional block that should be placed at the end of a chain.

Faust: `pm.wBell(opening)` (3 in / 3 out)

## Parameters

- **opening**: the ""opening"" of bell (0-1)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhWBell new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhWBell',
	#superclass : 'PhPmElement',
	#instVars : [
		'opening'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhWBell class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#opening -> 'the "opening" of bell (0-1)' }
]

{ #category : 'faust' }
PhWBell class >> argumentNames [

	^ #( #opening )
]

{ #category : 'faust' }
PhWBell class >> faustName [

	^ 'wBell'
]

{ #category : 'initialization' }
PhWBell >> initializeArguments [

	opening := PhHSlider new
			label: self label , 'Opening'
			values: #( 0.5 0 1 0.01 )
]

{ #category : 'accessing' }
PhWBell >> opening [

	^ opening
]

{ #category : 'accessing' }
PhWBell >> opening: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
