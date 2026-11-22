"
Formant filterbank based on a bank of fof filters. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the provided source to be realistic.

Faust: `pm.formantFilterbankFofCycle(voiceType, vowel, freq)` (1 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **freq**: the fundamental frequency of the excitation signal. Needed to calculate the skirtwidth of the FOF envelopes and for the autobendFreq and vocalEffort functions

## Example

```language=Pharo
(PhFormantFilterbankFofCycle new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFormantFilterbankFofCycle',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'freq'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFormantFilterbankFofCycle class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#freq -> 'the fundamental frequency of the excitation signal. Needed to calculate the skirtwidth of the FOF envelopes and for the autobendFreq and vocalEffort functions' }
]

{ #category : 'faust' }
PhFormantFilterbankFofCycle class >> argumentNames [

	^ #( #voiceType #vowel #freq )
]

{ #category : 'faust' }
PhFormantFilterbankFofCycle class >> faustName [

	^ 'formantFilterbankFofCycle'
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> freq [

	^ freq
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantFilterbankFofCycle >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 ).
	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 )
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhFormantFilterbankFofCycle >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
