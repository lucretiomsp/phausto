"
Generic marimba tone bar modal model.
This model was generated using `mesh2faust` from a 3D CAD model of a marimba tone bar (`libraries/modalmodels/marimbaBar`). The corresponding CAD model is that of a C2 tone bar (original fundamental frequency: ~65Hz). While `marimbaBarModel` allows to translate the harmonic content of the generated sound by providing a frequency (`freq`), mode transposition has limits and the model will sound less and less like a marimba tone bar as it diverges from C2. To make an accurate model of a marimba, we'd want to have an independent model for each bar...
This model contains 5 excitation positions going linearly from the center bottom to the center top of the bar. Obviously, a model with more excitation position could be regenerated using `mesh2faust`.

Faust: `pm.marimbaBarModel(freq, exPos, t60, t60DecayRatio, t60DecaySlope)` (1 in / 1 out)

## Parameters

- **freq**: fundamental frequency of the bar
- **exPos**: excitation position (0-4)
- **t60**: T60 in seconds (recommended value: 0.1)
- **t60DecayRatio**: T60 decay ratio (recommended value: 1)
- **t60DecaySlope**: T60 decay slope (recommended value: 5)

## Example

```language=Pharo
(PhMarimbaBarModel new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhMarimbaBarModel',
	#superclass : 'ModalPercussion',
	#instVars : [
		'freq',
		'exPos',
		't60',
		't60DecayRatio',
		't60DecaySlope'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
PhMarimbaBarModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'fundamental frequency of the bar'.
			#exPos -> 'excitation position (0-4)'.
			#t60 -> 'T60 in seconds (recommended value: 0.1)'.
			#t60DecayRatio -> 'T60 decay ratio (recommended value: 1)'.
			#t60DecaySlope -> 'T60 decay slope (recommended value: 5)' }
]

{ #category : 'faust' }
PhMarimbaBarModel class >> argumentNames [

	^ #( #freq #exPos #t60 #t60DecayRatio #t60DecaySlope )
]

{ #category : 'faust' }
PhMarimbaBarModel class >> faustName [

	^ 'marimbaBarModel'
]

{ #category : 'accessing' }
PhMarimbaBarModel >> exPos [

	^ exPos
]

{ #category : 'accessing' }
PhMarimbaBarModel >> exPos: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhMarimbaBarModel >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhMarimbaBarModel >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'accessing' }
PhMarimbaBarModel >> freq [

	^ freq
]

{ #category : 'accessing' }
PhMarimbaBarModel >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhMarimbaBarModel >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	exPos := PhHSlider new
			label: self label , 'ExPos'
			values: #( 0 0 4 1 ).
	t60 := PhHSlider new
			label: self label , 'T60'
			values: #( 0.1 0.01 5 0.01 ).
	t60DecayRatio := PhHSlider new
			label: self label , 'T60DecayRatio'
			values: #( 1 0 5 0.01 ).
	t60DecaySlope := PhHSlider new
			label: self label , 'T60DecaySlope'
			values: #( 5 0 10 0.01 )
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60 [

	^ t60
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60DecayRatio [

	^ t60DecayRatio
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60DecayRatio: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60DecaySlope [

	^ t60DecaySlope
]

{ #category : 'accessing' }
PhMarimbaBarModel >> t60DecaySlope: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
