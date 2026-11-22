"
Violin bowed string bidirectional block with controllable bow position. Terminations are not implemented in this model.

Faust: `pm.violinBowedString(stringLength, bowPressure, bowVelocity, bowPosition)` (3 in / 3 out)

## Parameters

- **stringLength**: the length of the string in meters
- **bowPressure**: bow pressure on the string (0-1)
- **bowVelocity**: velocity of the bow / excitation signal (0-1)
- **bowPosition**: the position of the bow on the string (0-1)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhViolinBowedString new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhViolinBowedString',
	#superclass : 'PhPmElement',
	#instVars : [
		'stringLength',
		'bowPressure',
		'bowVelocity',
		'bowPosition'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinBowedString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stringLength -> 'the length of the string in meters'.
			#bowPressure -> 'bow pressure on the string (0-1)'.
			#bowVelocity -> 'velocity of the bow / excitation signal (0-1)'.
			#bowPosition -> 'the position of the bow on the string (0-1)' }
]

{ #category : 'faust' }
PhViolinBowedString class >> argumentNames [

	^ #( #stringLength #bowPressure #bowVelocity #bowPosition )
]

{ #category : 'faust' }
PhViolinBowedString class >> faustName [

	^ 'violinBowedString'
]

{ #category : 'accessing' }
PhViolinBowedString >> bowPosition [

	^ bowPosition
]

{ #category : 'accessing' }
PhViolinBowedString >> bowPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhViolinBowedString >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
PhViolinBowedString >> bowPressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhViolinBowedString >> bowVelocity [

	^ bowVelocity
]

{ #category : 'accessing' }
PhViolinBowedString >> bowVelocity: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhViolinBowedString >> initializeArguments [

	stringLength := PhHSlider new
			label: self label , 'StringLength'
			values: #( 0.75 0.1 2 0.01 ).
	bowPressure := PhHSlider new
			label: self label , 'BowPressure'
			values: #( 0.5 0 1 0.01 ).
	bowVelocity := PhHSlider new
			label: self label , 'BowVelocity'
			values: #( 0.5 0 1 0.01 ).
	bowPosition := PhHSlider new
			label: self label , 'BowPosition'
			values: #( 0.7 0.01 0.99 0.01 )
]

{ #category : 'accessing' }
PhViolinBowedString >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
PhViolinBowedString >> stringLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
