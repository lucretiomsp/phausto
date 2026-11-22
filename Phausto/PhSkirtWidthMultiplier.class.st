"
Calculates value to multiply bandwidth to obtain `skirtwidth` for a Fof filter.

Faust: `pm.skirtWidthMultiplier(vowel, freq, gender)` (0 in / 1 out)

## Parameters

- **vowel**: the vowel (0: a, 1: e, 2: i, 3: o, 4: u)
- **freq**: the fundamental frequency of the excitation signal
- **gender**: gender of the voice used in the fof filter (0: male, 1: female)

## Example

```language=Pharo
dsp := PhSkirtWidthMultiplier new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhSkirtWidthMultiplier',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'vowel',
		'freq',
		'gender'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhSkirtWidthMultiplier class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#vowel -> 'the vowel (0: a, 1: e, 2: i, 3: o, 4: u)'.
			#freq -> 'the fundamental frequency of the excitation signal'.
			#gender -> 'gender of the voice used in the fof filter (0: male, 1: female)' }
]

{ #category : 'faust' }
PhSkirtWidthMultiplier class >> argumentNames [

	^ #( #vowel #freq #gender )
]

{ #category : 'faust' }
PhSkirtWidthMultiplier class >> faustName [

	^ 'skirtWidthMultiplier'
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> freq [

	^ freq
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> gender [

	^ gender
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> gender: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhSkirtWidthMultiplier >> initializeArguments [

	vowel := PhHSlider new
			label: self label , 'Vowel'
			values: #( 0 0 4 1 ).
	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 50 1500 1 ).
	gender := PhHSlider new
			label: self label , 'Gender'
			values: #( 0 0 1 1 )
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> vowel [

	^ vowel
]

{ #category : 'accessing' }
PhSkirtWidthMultiplier >> vowel: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
