"
Simple marimba physical model implementing a single tone bar connected to tube. This model is scalable and can be adapted to any size of bar/tube (see marimbaBarModel to know more about the limitations of this type of system).

Faust: `pm.marimbaModel(freq, exPos)` (1 in / 1 out)

## Parameters

- **freq**: the frequency of the bar/tube couple
- **exPos**: excitation position (0-4)

## Example

```language=Pharo
(PhMarimbaModel new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhMarimbaModel',
	#superclass : 'ModalPercussion',
	#instVars : [
		'freq',
		'exPos'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
PhMarimbaModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the frequency of the bar/tube couple'.
			#exPos -> 'excitation position (0-4)' }
]

{ #category : 'faust' }
PhMarimbaModel class >> argumentNames [

	^ #( #freq #exPos )
]

{ #category : 'faust' }
PhMarimbaModel class >> faustName [

	^ 'marimbaModel'
]

{ #category : 'accessing' }
PhMarimbaModel >> exPos [

	^ exPos
]

{ #category : 'accessing' }
PhMarimbaModel >> exPos: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhMarimbaModel >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhMarimbaModel >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'accessing' }
PhMarimbaModel >> freq [

	^ freq
]

{ #category : 'accessing' }
PhMarimbaModel >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhMarimbaModel >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	exPos := PhHSlider new
			label: self label , 'ExPos'
			values: #( 0 0 4 1 )
]
