"
Changes the gains of the formants based on the fundamental frequency of the excitation signal. Higher formants are reinforced for higher fundamental frequencies. Ported from `chant-lib`.

Faust: `pm.vocalEffort(freq, gender)` (1 in / 1 out)

## Parameters

- **freq**: the fundamental frequency of the excitation signal
- **gender**: the gender of the voice type (0: male, 1: female)

## Example

```language=Pharo
(PhVocalEffort new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhVocalEffort',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'freq',
		'gender'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhVocalEffort class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the fundamental frequency of the excitation signal'.
			#gender -> 'the gender of the voice type (0: male, 1: female)' }
]

{ #category : 'faust' }
PhVocalEffort class >> argumentNames [

	^ #( #freq #gender )
]

{ #category : 'faust' }
PhVocalEffort class >> faustName [

	^ 'vocalEffort'
]

{ #category : 'accessing' }
PhVocalEffort >> freq [

	^ freq
]

{ #category : 'accessing' }
PhVocalEffort >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhVocalEffort >> gender [

	^ gender
]

{ #category : 'accessing' }
PhVocalEffort >> gender: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhVocalEffort >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 ).
	gender := PhHSlider new
			label: self label , 'Gender'
			values: #( 0 0 1 1 )
]
