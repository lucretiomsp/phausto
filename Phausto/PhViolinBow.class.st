"
Bidirectional block implementing a violin bow and its interaction with a string.

Faust: `pm.violinBow(bowPressure, bowVelocity)` (3 in / 3 out)

## Parameters

- **bowPressure**: bow pressure on the string (0-1)
- **bowVelocity**: velocity of the bow / excitation signal (0-1)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhViolinBow new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhViolinBow',
	#superclass : 'PhPmElement',
	#instVars : [
		'bowPressure',
		'bowVelocity'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinBow class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#bowPressure -> 'bow pressure on the string (0-1)'.
			#bowVelocity -> 'velocity of the bow / excitation signal (0-1)' }
]

{ #category : 'faust' }
PhViolinBow class >> argumentNames [

	^ #( #bowPressure #bowVelocity )
]

{ #category : 'faust' }
PhViolinBow class >> faustName [

	^ 'violinBow'
]

{ #category : 'accessing' }
PhViolinBow >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
PhViolinBow >> bowPressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhViolinBow >> bowVelocity [

	^ bowVelocity
]

{ #category : 'accessing' }
PhViolinBow >> bowVelocity: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhViolinBow >> initializeArguments [

	bowPressure := PhHSlider new
			label: self label , 'BowPressure'
			values: #( 0.5 0 1 0.01 ).
	bowVelocity := PhHSlider new
			label: self label , 'BowVelocity'
			values: #( 0.5 0 1 0.01 )
]
