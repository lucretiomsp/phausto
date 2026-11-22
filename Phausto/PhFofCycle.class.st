"
FOF implementation where time-varying filter parameter noise is mitigated by using a cycle of `n` sample and hold FOF filters.

Faust: `pm.fofCycle(fc, bw, a, g, n)` (1 in / 1 out)

## Parameters

- **fc**: formant center frequency
- **bw**: formant bandwidth (Hz)
- **sw**: formant skirtwidth (Hz)
- **g**: linear scale factor (g=1 gives 0dB amplitude response at fc)
- **n**: the number of FOF filters to cycle through _(compile-time constant: give me a Number)_

## Example

```language=Pharo
(PhFofCycle new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFofCycle',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'fc',
		'bw',
		'sw',
		'g',
		'n'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFofCycle class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#fc -> 'formant center frequency'.
			#bw -> 'formant bandwidth (Hz)'.
			#sw -> 'formant skirtwidth (Hz)'.
			#g -> 'linear scale factor (g=1 gives 0dB amplitude response at fc)'.
			#n -> 'the number of FOF filters to cycle through' }
]

{ #category : 'faust' }
PhFofCycle class >> argumentNames [

	^ #( #fc #bw #sw #g #n )
]

{ #category : 'faust' }
PhFofCycle class >> faustName [

	^ 'fofCycle'
]

{ #category : 'accessing' }
PhFofCycle >> bw [

	^ bw
]

{ #category : 'accessing' }
PhFofCycle >> bw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofCycle >> fc [

	^ fc
]

{ #category : 'accessing' }
PhFofCycle >> fc: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofCycle >> g [

	^ g
]

{ #category : 'accessing' }
PhFofCycle >> g: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFofCycle >> initializeArguments [

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
			values: #( 1 0 1 0.01 ).
	n := 5
]

{ #category : 'accessing' }
PhFofCycle >> n [

	^ n
]

{ #category : 'accessing' }
PhFofCycle >> n: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofCycle >> sw [

	^ sw
]

{ #category : 'accessing' }
PhFofCycle >> sw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
