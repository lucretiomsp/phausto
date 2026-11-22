"
Simple marimba resonance tube.

Faust: `pm.marimbaResTube(tubeLength, excitation)` (0 in / 1 out)

## Parameters

- **tubeLength**: the length of the tube in meters
- **excitation**: the excitation signal (audio in)

## Example

```language=Pharo
dsp := PhMarimbaResTube new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhMarimbaResTube',
	#superclass : 'ModalPercussion',
	#instVars : [
		'tubeLength',
		'excitation'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
PhMarimbaResTube class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'the length of the tube in meters'.
			#excitation -> 'the excitation signal (audio in)' }
]

{ #category : 'faust' }
PhMarimbaResTube class >> argumentNames [

	^ #( #tubeLength #excitation )
]

{ #category : 'faust' }
PhMarimbaResTube class >> faustName [

	^ 'marimbaResTube'
]

{ #category : 'accessing' }
PhMarimbaResTube >> excitation [

	^ excitation
]

{ #category : 'accessing' }
PhMarimbaResTube >> excitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhMarimbaResTube >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.05 2.9 0.01 ).
	excitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhMarimbaResTube >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
PhMarimbaResTube >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
