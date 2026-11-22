"
Standard church bell modal model.
Modeled after T. Rossing and R. Perrin, Vibrations of Bells, Applied Acoustics 2, 1987.
Model height is 1.8 m.
This model contains 7 excitation positions going linearly from the bottom to the top of the bell. Obviously, a model with more excitation position could be regenerated using `mesh2faust`.
This function also implement a virtual exciter to drive the model.

Faust: `pm.standardBell(strikePosition, strikeCutoff, strikeSharpness, gain, trigger)` (0 in / 1 out)

## Parameters

- **strikePosition**: strike position (0-6)
- **strikeCutoff**: cuttoff frequency of the strike genarator (recommended: ~7000Hz)
- **strikeSharpness**: sharpness of the strike (recommended: ~0.25)
- **gain**: gain of the strike (0-1)
- **trigger**: signal (0: off, 1: on)

## Example

```language=Pharo
dsp := StandardBell new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'StandardBell',
	#superclass : 'ModalPercussion',
	#instVars : [
		'strikePosition',
		'strikeCutoff',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
StandardBell class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#strikePosition -> 'strike position (0-6)'.
			#strikeCutoff -> 'cuttoff frequency of the strike genarator (recommended: ~7000Hz)'.
			#strikeSharpness -> 'sharpness of the strike (recommended: ~0.25)'.
			#gain -> 'gain of the strike (0-1)'.
			#trigger -> 'signal (0: off, 1: on)' }
]

{ #category : 'faust' }
StandardBell class >> argumentNames [

	^ #( #strikePosition #strikeCutoff #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
StandardBell class >> faustName [

	^ 'standardBell'
]

{ #category : 'accessing' }
StandardBell >> gain [

	^ gain
]

{ #category : 'accessing' }
StandardBell >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
StandardBell >> initializeArguments [

	strikePosition := PhHSlider new
			label: self label , 'StrikePosition'
			values: #( 0 0 6 1 ).
	strikeCutoff := PhHSlider new
			label: self label , 'StrikeCutoff'
			values: #( 7000 100 9000 1 ).
	strikeSharpness := PhHSlider new
			label: self label , 'StrikeSharpness'
			values: #( 0.25 0.001 1 0.001 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
StandardBell >> strikeCutoff [

	^ strikeCutoff
]

{ #category : 'accessing' }
StandardBell >> strikeCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
StandardBell >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
StandardBell >> strikePosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
StandardBell >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
StandardBell >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
StandardBell >> trigger [

	^ trigger
]

{ #category : 'accessing' }
StandardBell >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
