"
Extremely basic bow table that can be used to implement a wide range of bow types for many different bowed string instruments (violin, cello, etc.).

Faust: `pm.bowTable(offset, slope)` (1 in / 1 out)

## Parameters

- **offset**: table offset
- **slope**: table slope

## Example

```language=Pharo
(PhBowTable new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhBowTable',
	#superclass : 'PhPmFunction',
	#instVars : [
		'offset',
		'slope'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhBowTable class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#offset -> 'table offset'.
			#slope -> 'table slope' }
]

{ #category : 'faust' }
PhBowTable class >> argumentNames [

	^ #( #offset #slope )
]

{ #category : 'faust' }
PhBowTable class >> faustName [

	^ 'bowTable'
]

{ #category : 'accessing' }
PhBowTable >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhBowTable >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhBowTable >> initializeArguments [

	offset := PhHSlider new
			label: self label , 'Offset'
			values: #( 0 0 1 0.01 ).
	slope := PhHSlider new
			label: self label , 'Slope'
			values: #( 3 1 5 0.01 )
]

{ #category : 'accessing' }
PhBowTable >> offset [

	^ offset
]

{ #category : 'accessing' }
PhBowTable >> offset: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBowTable >> slope [

	^ slope
]

{ #category : 'accessing' }
PhBowTable >> slope: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
