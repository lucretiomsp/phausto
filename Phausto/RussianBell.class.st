"
French church bell modal model.

Modeled after D.Bartocha and Baron, Influence of Tin Bronze Melting and Pouring Parameters on Its Properties and Bell' Tone, Archives of Foundry Engineering, 2016.

Model height is 1 m.

This model contains 7 excitation positions going linearly from the bottom to the top of the bell.
"
Class {
	#name : 'RussianBell',
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
RussianBell class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#strikePosition -> 'strike position (0-6)'.
			#strikeCutoff -> 'cuttoff frequency of the strike genarator (recommended: ~7000Hz)'.
			#strikeSharpness -> 'sharpness of the strike (recommended: ~0.25)'.
			#gain -> 'gain of the strike (0-1)'.
			#trigger -> 'signal (0: off, 1: on)' }
]

{ #category : 'faust' }
RussianBell class >> argumentNames [

	^ #( #strikePosition #strikeCutoff #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
RussianBell class >> faustName [

	^ 'russianBell'
]

{ #category : 'accessing' }
RussianBell >> gain [

	^ gain
]

{ #category : 'accessing' }
RussianBell >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
RussianBell >> initializeArguments [

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
RussianBell >> strikeCutoff [

	^ strikeCutoff
]

{ #category : 'accessing' }
RussianBell >> strikeCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
RussianBell >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
RussianBell >> strikePosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
RussianBell >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
RussianBell >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
RussianBell >> trigger [

	^ trigger
]

{ #category : 'accessing' }
RussianBell >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
