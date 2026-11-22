"
Function to generate a single Formant-Wave-Function.

Faust: `pm.fof(fc, bw, sw, g)` (1 in / 1 out)

## Parameters

- **fc**: formant center frequency,
- **bw**: formant bandwidth (Hz),
- **sw**: formant skirtwidth (Hz)
- **g**: linear scale factor (g=1 gives 0dB amplitude response at fc)

## Example

```language=Pharo
(PhFof new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFof',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'fc',
		'bw',
		'sw',
		'g'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFof class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#fc -> 'formant center frequency,'.
			#bw -> 'formant bandwidth (Hz),'.
			#sw -> 'formant skirtwidth (Hz)'.
			#g -> 'linear scale factor (g=1 gives 0dB amplitude response at fc)' }
]

{ #category : 'faust' }
PhFof class >> argumentNames [

	^ #( #fc #bw #sw #g )
]

{ #category : 'faust' }
PhFof class >> faustName [

	^ 'fof'
]

{ #category : 'accessing' }
PhFof >> bw [

	^ bw
]

{ #category : 'accessing' }
PhFof >> bw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFof >> fc [

	^ fc
]

{ #category : 'accessing' }
PhFof >> fc: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFof >> g [

	^ g
]

{ #category : 'accessing' }
PhFof >> g: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFof >> initializeArguments [

	fc := PhHSlider new
			label: self label , 'Fc'
			values: #( 500 20 10000 1 ).
	bw := PhHSlider new
			label: self label , 'Bw'
			values: #( 50 1 1000 1 ).
	sw := PhHSlider new
			label: self label , 'Sw'
			values: #( 200 1 1000 1 ).
	g := PhHSlider new
			label: self label , 'G'
			values: #( 1 0 1 0.01 )
]

{ #category : 'accessing' }
PhFof >> sw [

	^ sw
]

{ #category : 'accessing' }
PhFof >> sw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
