"
Formant filterbank which can use different types of filterbank functions and different excitation signals. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the provided source to be realistic.

Faust: `pm.formantFilterbank(voiceType, vowel, formantGen, freq)` (1 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **formantGen**: the specific formant filterbank function (i.e. FormantFilterbankBP, FormantFilterbankFof,...)
- **freq**: fundamental frequency of excitation signal. Needed for FOF version to calculate rise time of envelope

## Example

```language=Pharo
(PhFormantFilterbank new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhFormantFilterbank',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'formantGen',
		'freq'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFormantFilterbank class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#formantGen -> 'the specific formant filterbank function (i.e. FormantFilterbankBP, FormantFilterbankFof,...)'.
			#freq -> 'fundamental frequency of excitation signal. Needed for FOF version to calculate rise time of envelope' }
]

{ #category : 'faust' }
PhFormantFilterbank class >> argumentNames [

	^ #( #voiceType #vowel #formantGen #freq )
]

{ #category : 'faust' }
PhFormantFilterbank class >> faustName [

	^ 'formantFilterbank'
]

{ #category : 'accessing' }
PhFormantFilterbank >> formantGen [

	^ formantGen
]

{ #category : 'accessing' }
PhFormantFilterbank >> formantGen: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterbank >> freq [

	^ freq
]

{ #category : 'accessing' }
PhFormantFilterbank >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantFilterbank >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 ).
	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	formantGen := 'pm.formantFilterBP'.
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 )
]

{ #category : 'accessing' }
PhFormantFilterbank >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhFormantFilterbank >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantFilterbank >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhFormantFilterbank >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
