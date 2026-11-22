"
Autobends the center frequencies of formants 1 and 2 based on the fundamental frequency of the excitation signal and leaves all other formant frequencies unchanged. Ported from `chant-lib`.

Faust: `pm.autobendFreq(n, freq, voiceType)` (1 in / 1 out)

## Parameters

- **n**: formant index _(compile-time constant: give me a Number)_
- **freq**: the fundamental frequency of the excitation signal
- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)

## Example

```language=Pharo
(PhAutobendFreq new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhAutobendFreq',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'n',
		'freq',
		'voiceType'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhAutobendFreq class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#n -> 'formant index'.
			#freq -> 'the fundamental frequency of the excitation signal'.
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)' }
]

{ #category : 'faust' }
PhAutobendFreq class >> argumentNames [

	^ #( #n #freq #voiceType )
]

{ #category : 'faust' }
PhAutobendFreq class >> faustName [

	^ 'autobendFreq'
]

{ #category : 'accessing' }
PhAutobendFreq >> freq [

	^ freq
]

{ #category : 'accessing' }
PhAutobendFreq >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhAutobendFreq >> initializeArguments [

	n := 0.
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 ).
	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 )
]

{ #category : 'accessing' }
PhAutobendFreq >> n [

	^ n
]

{ #category : 'accessing' }
PhAutobendFreq >> n: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhAutobendFreq >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
PhAutobendFreq >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
