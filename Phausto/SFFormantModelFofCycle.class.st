"
Simple formant/vocal synthesizer based on a source/filter model. The source is just a periodic impulse and the ""filter"" is a bank of FOF filters. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the synthesized voice to be realistic. This model does not work with noise in the source signal so exType has been removed and model does not depend on SFFormantModel function.

## Parameters:

**voiceType**: the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)
**vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u
**freq**: the fundamental frequency of the source signal**
**gain:** linear gain multiplier to multiply the source by
"
Class {
	#name : 'SFFormantModelFofCycle',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'freq',
		'gain'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelFofCycle class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u'.
			#freq -> 'the fundamental frequency of the source signal'.
			#gain -> 'linear gain multiplier to multiply the source by' }
]

{ #category : 'faust' }
SFFormantModelFofCycle class >> argumentNames [

	^ #( #voiceType #vowel #freq #gain )
]

{ #category : 'faust' }
SFFormantModelFofCycle class >> faustName [

	^ 'SFFormantModelFofCycle'
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> freq [

	^ freq
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> gain [

	^ gain
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
SFFormantModelFofCycle >> initializeArguments [

	voiceType := PhHSlider new
			label: self label , 'VoiceType'
			values: #( 0 0 4 1 ).
	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 220 50 1500 1 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 )
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> vowel [

	^ vowel
]

{ #category : 'accessing' }
SFFormantModelFofCycle >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
