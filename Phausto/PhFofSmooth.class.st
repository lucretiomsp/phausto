"
FOF implementation where time-varying filter parameter noise is mitigated by lowpass filtering the filter parameters `bw` and `a` with smooth.

Faust: `pm.fofSmooth(fc, bw, sw, g, tau)` (1 in / 1 out)

## Parameters

- **fc**: formant center frequency
- **bw**: formant bandwidth (Hz)
- **sw**: formant skirtwidth (Hz)
- **g**: linear scale factor (g=1 gives 0dB amplitude response at fc)
- **tau**: the desired smoothing time constant in seconds

## Example

```language=Pharo
(PhFofSmooth new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFofSmooth',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'fc',
		'bw',
		'sw',
		'g',
		'tau'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFofSmooth class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#fc -> 'formant center frequency'.
			#bw -> 'formant bandwidth (Hz)'.
			#sw -> 'formant skirtwidth (Hz)'.
			#g -> 'linear scale factor (g=1 gives 0dB amplitude response at fc)'.
			#tau -> 'the desired smoothing time constant in seconds' }
]

{ #category : 'faust' }
PhFofSmooth class >> argumentNames [

	^ #( #fc #bw #sw #g #tau )
]

{ #category : 'faust' }
PhFofSmooth class >> faustName [

	^ 'fofSmooth'
]

{ #category : 'accessing' }
PhFofSmooth >> bw [

	^ bw
]

{ #category : 'accessing' }
PhFofSmooth >> bw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofSmooth >> fc [

	^ fc
]

{ #category : 'accessing' }
PhFofSmooth >> fc: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofSmooth >> g [

	^ g
]

{ #category : 'accessing' }
PhFofSmooth >> g: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFofSmooth >> initializeArguments [

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
	tau := PhHSlider new
			label: self label , 'Tau'
			values: #( 0.001 0 0.1 0.0001 )
]

{ #category : 'accessing' }
PhFofSmooth >> sw [

	^ sw
]

{ #category : 'accessing' }
PhFofSmooth >> sw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFofSmooth >> tau [

	^ tau
]

{ #category : 'accessing' }
PhFofSmooth >> tau: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
