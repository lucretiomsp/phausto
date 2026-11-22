"
A bidirectional block implementing a ""generic"" string with selectable excitation position. It also has a built-in pickup whose position is the same as the excitation position. Thus, moving the excitation position will also move the pickup.

Faust: `pm.openStringPick(length, stiffness, pluckPosition, excitation)` (3 in / 3 out)

## Parameters

- **length**: the length of the string in meters
- **stiffness**: the stiffness of the string (0-1) (1 for max stiffness)
- **pluckPosition**: excitation position (0-1) (1 is bottom)
- **excitation**: the excitation signal

## Example

```language=Pharo
(PhLStringRigidTermination new => PhOpenStringPick new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhOpenStringPick',
	#superclass : 'PhStringAbstract',
	#instVars : [
		'length',
		'stiffness',
		'pluckPosition',
		'excitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhOpenStringPick class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'the length of the string in meters'.
			#stiffness -> 'the stiffness of the string (0-1) (1 for max stiffness)'.
			#pluckPosition -> 'excitation position (0-1) (1 is bottom)'.
			#excitation -> 'the excitation signal' }
]

{ #category : 'faust' }
PhOpenStringPick class >> argumentNames [

	^ #( #length #stiffness #pluckPosition #excitation )
]

{ #category : 'faust' }
PhOpenStringPick class >> faustName [

	^ 'openStringPick'
]

{ #category : 'accessing' }
PhOpenStringPick >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhOpenStringPick >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhOpenStringPick >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 2 0.01 ).
	stiffness := PhHSlider new
			label: self label , 'Stiffness'
			values: #( 0.5 0 1 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhOpenStringPick >> length [

	^ length
]

{ #category : 'accessing' }
PhOpenStringPick >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPick >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhOpenStringPick >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenStringPick >> stiffness [

	^ stiffness
]

{ #category : 'accessing' }
PhOpenStringPick >> stiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
