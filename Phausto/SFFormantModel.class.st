"
Simple formant/vocal synthesizer based on a source/filter model. The `source` and `filterbank` must be specified by the user. `filterbank` must take the same input parameters as formantFilterbank (`BP`/`FofCycle` /`FofSmooth`). Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the synthesized voice to be realistic.

Faust: `pm.SFFormantModel(voiceType, vowel, exType, freq, gain, source, filterbank, isFof)` (0 in / 1 out)

## Parameters

- **voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u
- **exType**: voice vs. fricative sound ratio (0-1 where 1 is 100% fricative)
- **freq**: the fundamental frequency of the source signal
- **gain**: linear gain multiplier to multiply the source by
- **source**: the source signal
- **filterbank**: the formant filterbank function (pm.formantFilterbankBP, pm.formantFilterbankFofCycle or pm.formantFilterbankFofSmooth)
- **isFof**: whether model is FOF based (0: no, 1: yes) _(compile-time constant: give me a Number)_

## Example

```language=Pharo
dsp := SFFormantModel new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'SFFormantModel',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'exType',
		'freq',
		'gain',
		'source',
		'filterbank',
		'isFof'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u'.
			#exType -> 'voice vs. fricative sound ratio (0-1 where 1 is 100% fricative)'.
			#freq -> 'the fundamental frequency of the source signal'.
			#gain -> 'linear gain multiplier to multiply the source by'.
			#source -> 'the source signal'.
			#filterbank -> 'the formant filterbank function (pm.formantFilterbankBP, pm.formantFilterbankFofCycle or pm.formantFilterbankFofSmooth)'.
			#isFof -> 'whether model is FOF based (0: no, 1: yes)' }
]

{ #category : 'faust' }
SFFormantModel class >> argumentNames [

	^ #( #voiceType #vowel #exType #freq #gain #source #filterbank #isFof )
]

{ #category : 'faust' }
SFFormantModel class >> faustName [

	^ 'SFFormantModel'
]

{ #category : 'accessing' }
SFFormantModel >> exType [

	^ exType
]

{ #category : 'accessing' }
SFFormantModel >> exType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> filterbank [

	^ filterbank
]

{ #category : 'accessing' }
SFFormantModel >> filterbank: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> freq [

	^ freq
]

{ #category : 'accessing' }
SFFormantModel >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> gain [

	^ gain
]

{ #category : 'accessing' }
SFFormantModel >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
SFFormantModel >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 ).
	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	exType := PhHSlider new
			label: self label , 'ExType'
			values: #( 0 0 1 0.01 ).
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 220 50 1500 1 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	source := 'os.sawtooth(220)'.
	filterbank := 'pm.formantFilterbankBP'.
	isFof := 0
]

{ #category : 'accessing' }
SFFormantModel >> isFof [

	^ isFof
]

{ #category : 'accessing' }
SFFormantModel >> isFof: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> source [

	^ source
]

{ #category : 'accessing' }
SFFormantModel >> source: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
SFFormantModel >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModel >> vowel [

	^ vowel
]

{ #category : 'accessing' }
SFFormantModel >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
