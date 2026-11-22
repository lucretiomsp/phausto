"
Formant filter based on a single FOF filter. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Fof filter parameters are lowpass filtered to mitigate possible noise from varying them in realtime. Voice type can be selected but must correspond to the frequency range of the provided source to be realistic.

Faust: `pm.formantFilterFofSmooth(voiceType, vowel, nFormants, i, freq)` (1 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **nFormants**: number of formant regions in frequency domain, typically 5 _(compile-time constant: give me a Number)_
- **formantIndex**: formant number (i.e. 1 - 5) used to index formant data value arrays _(compile-time constant: give me a Number)_
- **freq**: fundamental frequency of excitation signal. Used to calculate rise time of envelope

## Example

```language=Pharo
(PhFormantFilterFofSmooth new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFormantFilterFofSmooth',
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
PhFormantFilterFofSmooth class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#nFormants -> 'number of formant regions in frequency domain, typically 5'.
			#formantIndex -> 'formant number (i.e. 1 - 5) used to index formant data value arrays'.
			#freq -> 'fundamental frequency of excitation signal. Used to calculate rise time of envelope' }
]

{ #category : 'faust' }
PhFormantFilterFofSmooth class >> argumentNames [

	^ #( #voiceType #vowel #nFormants #formantIndex #freq )
]

{ #category : 'faust' }
PhFormantFilterFofSmooth class >> faustName [

	^ 'formantFilterFofSmooth'
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> formantIndex [

	^ formantIndex
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> formantIndex: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> freq [

	^ freq
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantFilterFofSmooth >> initializeArguments [

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
PhFormantFilterFofSmooth >> nFormants [

	^ nFormants
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> nFormants: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhFormantFilterFofSmooth >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
