"
Violin bow table based on bowTable.

Faust: `pm.violinBowTable(bowPressure)` (1 in / 1 out)

## Parameters

- **bowPressure**: bow pressure on the string (0-1)

## Example

```language=Pharo
(PhViolinBowTable new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhViolinBowTable',
	#superclass : 'PhPmFunction',
	#instVars : [
		'bowPressure'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinBowTable class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#bowPressure -> 'bow pressure on the string (0-1)' }
]

{ #category : 'faust' }
PhViolinBowTable class >> argumentNames [

	^ #( #bowPressure )
]

{ #category : 'faust' }
PhViolinBowTable class >> faustName [

	^ 'violinBowTable'
]

{ #category : 'accessing' }
PhViolinBowTable >> bowPressure [

	^ bowPressure
]

{ #category : 'accessing' }
PhViolinBowTable >> bowPressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhViolinBowTable >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhViolinBowTable >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhViolinBowTable >> initializeArguments [

	bowPressure := PhHSlider new
			label: self label , 'BowPressure'
			values: #( 0.5 0 1 0.01 )
]
