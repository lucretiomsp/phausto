"
Dirt-simple djembe modal physical model. Mode parameters are empirically calculated and don't correspond to any measurements or 3D model. They kind of sound good though :).

Faust: `pm.djembeModel(freq)` (1 in / 1 out)

## Parameters

- **freq**: fundamental frequency of the bar

## Example

```language=Pharo
(PhDjembeModel new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhDjembeModel',
	#superclass : 'ModalPercussion',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
PhDjembeModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'fundamental frequency of the bar' }
]

{ #category : 'faust' }
PhDjembeModel class >> argumentNames [

	^ #( #freq )
]

{ #category : 'faust' }
PhDjembeModel class >> faustName [

	^ 'djembeModel'
]

{ #category : 'accessing' }
PhDjembeModel >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhDjembeModel >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'accessing' }
PhDjembeModel >> freq [

	^ freq
]

{ #category : 'accessing' }
PhDjembeModel >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhDjembeModel >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 60 20 500 1 )
]
