"
Formant filter based on a single resonant bandpass filter. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the provided source to be realistic.

Faust: `pm.formantFilterBP(voiceType, vowel, nFormants, i, freq)` (1 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **nFormants**: number of formant regions in frequency domain, typically 5 _(compile-time constant: give me a Number)_
- **formantIndex**: formant index used to index formant data value arrays _(compile-time constant: give me a Number)_
- **freq**: fundamental frequency of excitation signal.

## Example

```language=Pharo
(PhFormantFilterBP new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFormantFilterBP',
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
PhFormantFilterBP class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#nFormants -> 'number of formant regions in frequency domain, typically 5'.
			#formantIndex -> 'formant index used to index formant data value arrays'.
			#freq -> 'fundamental frequency of excitation signal.' }
]

{ #category : 'faust' }
PhFormantFilterBP class >> argumentNames [

	^ #( #voiceType #vowel #nFormants #formantIndex #freq )
]

{ #category : 'faust' }
PhFormantFilterBP class >> faustName [

	^ 'formantFilterBP'
]

{ #category : 'accessing' }
PhFormantFilterBP >> formantIndex [

	^ formantIndex
]

{ #category : 'accessing' }
PhFormantFilterBP >> formantIndex: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterBP >> freq [

	^ freq
]

{ #category : 'accessing' }
PhFormantFilterBP >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantFilterBP >> initializeArguments [

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
PhFormantFilterBP >> nFormants [

	^ nFormants
]

{ #category : 'accessing' }
PhFormantFilterBP >> nFormants: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterBP >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhFormantFilterBP >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterBP >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhFormantFilterBP >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
