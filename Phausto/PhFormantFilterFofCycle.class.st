"
Formant filter based on a single FOF filter. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. A cycle of `n` fof filters with sample-and-hold is used so that the fof filter parameters can be varied in realtime. This technique is more robust but more computationally expensive than formantFilterFofSmooth.Voice type can be selected but must correspond to the frequency range of the provided source to be realistic.

Faust: `pm.formantFilterFofCycle(voiceType, vowel, nFormants, i, freq)` (1 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **nFormants**: number of formant regions in frequency domain, typically 5 _(compile-time constant: give me a Number)_
- **formantIndex**: formant number (i.e. 0 - 4) used to index formant data value arrays _(compile-time constant: give me a Number)_
- **freq**: fundamental frequency of excitation signal. Used to calculate rise time of envelope

## Example

```language=Pharo
(PhFormantFilterFofCycle new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFormantFilterFofCycle',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'nFormants',
		'formantIndex',
		'freq'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFormantFilterFofCycle class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#nFormants -> 'number of formant regions in frequency domain, typically 5'.
			#formantIndex -> 'formant number (i.e. 0 - 4) used to index formant data value arrays'.
			#freq -> 'fundamental frequency of excitation signal. Used to calculate rise time of envelope' }
]

{ #category : 'faust' }
PhFormantFilterFofCycle class >> argumentNames [

	^ #( #voiceType #vowel #nFormants #formantIndex #freq )
]

{ #category : 'faust' }
PhFormantFilterFofCycle class >> faustName [

	^ 'formantFilterFofCycle'
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> formantIndex [

	^ formantIndex
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> formantIndex: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> freq [

	^ freq
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantFilterFofCycle >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 ).
	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	nFormants := 5.
	formantIndex := 0.
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 )
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> nFormants [

	^ nFormants
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> nFormants: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhFormantFilterFofCycle >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
