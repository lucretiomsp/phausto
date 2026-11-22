"
FOF with sample and hold used on `bw` and a parameter used in the filter-cycling FOF function `fofCycle`.

Faust: `pm.fofSH(fc, bw, a, g)` (1 in / 1 out)

## Parameters

- **fc**: formant center frequency
- **bw**: formant bandwidth (Hz)
- **sw**: formant skirtwidth (Hz)
- **g**: linear scale factor (g=1 gives 0dB amplitude response at fc)

## Example

```language=Pharo
(PhFofSH new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFofSH',
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
PhFofSH class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#fc -> 'formant center frequency'.
			#bw -> 'formant bandwidth (Hz)'.
			#sw -> 'formant skirtwidth (Hz)'.
			#g -> 'linear scale factor (g=1 gives 0dB amplitude response at fc)' }
]

{ #category : 'faust' }
PhFofSH class >> argumentNames [

	^ #( #fc #bw #sw #g )
]

{ #category : 'faust' }
PhFofSH class >> faustName [

	^ 'fofSH'
]

{ #category : 'accessing' }
PhFofSH >> bw [

	^ bw
]

{ #category : 'accessing' }
PhFofSH >> bw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofSH >> fc [

	^ fc
]

{ #category : 'accessing' }
PhFofSH >> fc: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofSH >> g [

	^ g
]

{ #category : 'accessing' }
PhFofSH >> g: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFofSH >> initializeArguments [

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
PhFofSH >> sw [

	^ sw
]

{ #category : 'accessing' }
PhFofSH >> sw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
