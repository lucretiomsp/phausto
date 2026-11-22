"
Simple formant/vocal synthesizer based on a source/filter model. The source is just a sawtooth wave and the ""filter"" is a bank of resonant bandpass filters. Formant parameters are linearly interpolated allowing to go smoothly from one vowel to another. Voice type can be selected but must correspond to the frequency range of the synthesized voice to be realistic.
"
Class {
	#name : 'SFFormantModelBP',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'voiceType',
		'vowel',
		'exType',
		'freq',
		'gain'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
SFFormantModelBP class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#voiceType -> 'the voice type (0: alto, 1: bass, 2: countertenor, 3: soprano, 4: tenor)'.
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u'.
			#exType -> 'voice vs. fricative sound ratio (0-1 where 1 is 100% fricative)'.
			#freq -> 'the fundamental frequency of the source signal'.
			#gain -> 'linear gain multiplier to multiply the source by' }
]

{ #category : 'faust' }
SFFormantModelBP class >> argumentNames [

	^ #( #voiceType #vowel #exType #freq #gain )
]

{ #category : 'faust' }
SFFormantModelBP class >> faustName [

	^ 'SFFormantModelBP'
]

{ #category : 'accessing' }
SFFormantModelBP >> exType [

	^ exType
]

{ #category : 'accessing' }
SFFormantModelBP >> exType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModelBP >> freq [

	^ freq
]

{ #category : 'accessing' }
SFFormantModelBP >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModelBP >> gain [

	^ gain
]

{ #category : 'accessing' }
SFFormantModelBP >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
SFFormantModelBP >> initializeArguments [

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
			values: #( 0.5 0 1 0.001 )
]

{ #category : 'accessing' }
SFFormantModelBP >> voiceType [

	^ voiceType
]

{ #category : 'accessing' }
SFFormantModelBP >> voiceType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
SFFormantModelBP >> vowel [

	^ vowel
]

{ #category : 'accessing' }
SFFormantModelBP >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
