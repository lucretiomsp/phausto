"
Simple marimba physical model implementing a single tone bar connected to tube.
The marimba is a musical instrument in the percussion family that consists of wooden bars that are struck by mallets. Below each bar is a resonator pipe that amplifies particular harmonics of its sound.
The term is of Bantu origin, deriving from the prefix ma- meaning 'many' and -rimba meaning 'xylophone'.
(from Wikipedia) 
"
Class {
	#name : 'Marimba',
	#superclass : 'ModalPercussion',
	#instVars : [
		'freq',
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
Marimba class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the frequency of the bar/tube couple'.
			#strikePosition -> 'strike position (0-4)'.
			#strikeCutoff -> 'cuttoff frequency of the strike genarator (recommended: ~7000Hz)'.
			#strikeSharpness -> 'sharpness of the strike (recommended: ~0.25)'.
			#gain -> 'gain of the strike (0-1)'.
			#trigger -> 'signal (0: off, 1: on)' }
]

{ #category : 'faust' }
Marimba class >> argumentNames [

	^ #( #freq #strikePosition #strikeCutoff #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
Marimba class >> faustName [

	^ 'marimba'
]

{ #category : 'accessing' }
Marimba >> freq [

	^ freq
]

{ #category : 'accessing' }
Marimba >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Marimba >> gain [

	^ gain
]

{ #category : 'accessing' }
Marimba >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
Marimba >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	strikePosition := PhHSlider new
			label: self label , 'StrikePosition'
			values: #( 0 0 4 1 ).
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
Marimba >> strikeCutoff [

	^ strikeCutoff
]

{ #category : 'accessing' }
Marimba >> strikeCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Marimba >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
Marimba >> strikePosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Marimba >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
Marimba >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Marimba >> trigger [

	^ trigger
]

{ #category : 'accessing' }
Marimba >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
