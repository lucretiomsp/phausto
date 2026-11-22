"
Dirt-simple djembe modal physical model. Mode parameters are empirically calculated and don't correspond to any measurements or 3D model. They kind of sound good though :).

This model also implements a virtual ""exciter"".
"
Class {
	#name : 'Djembe',
	#superclass : 'ModalPercussion',
	#instVars : [
		'freq',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
Djembe class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'fundamental frequency of the model'.
			#strikePosition -> 'strike position (0 for the middle of the membrane and 1 for the edge)'.
			#strikeSharpness -> 'sharpness of the strike (0-1, default: 0.5)'.
			#gain -> 'gain of the strike'.
			#trigger -> 'trigger signal (0: off, 1: on)' }
]

{ #category : 'faust' }
Djembe class >> argumentNames [

	^ #( #freq #strikePosition #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
Djembe class >> faustName [

	^ 'djembe'
]

{ #category : 'accessing' }
Djembe >> freq [

	^ freq
]

{ #category : 'accessing' }
Djembe >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Djembe >> gain [

	^ gain
]

{ #category : 'accessing' }
Djembe >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
Djembe >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	strikePosition := PhHSlider new
			label: self label , 'StrikePosition'
			values: #( 0.5 0 1 0.01 ).
	strikeSharpness := PhHSlider new
			label: self label , 'StrikeSharpness'
			values: #( 0.3 0.001 1 0.001 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
Djembe >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
Djembe >> strikePosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Djembe >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
Djembe >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Djembe >> trigger [

	^ trigger
]

{ #category : 'accessing' }
Djembe >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
