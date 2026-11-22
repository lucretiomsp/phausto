"
Strikes generator with controllable excitation position

## Parameters

- **strikePosition**: excitation position wiht 0: for max low freqs and 1: for max high freqs. So, on membrane for example, 0 would be the middle and 1 the edge
- **strikeSharpness**: sharpness of the attack and release (0-1)
- **gain**: gain of the excitation
- **trigger**: a gate button/trigger signal (0-1)
"
Class {
	#name : 'PhStrike',
	#superclass : 'Exciter',
	#instVars : [
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhStrike class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#strikePosition -> 'excitation position wiht 0: for max low freqs and 1: for max high freqs. So, on membrane for example, 0 would be the middle and 1 the edge'.
			#strikeSharpness -> 'sharpness of the attack and release (0-1)'.
			#gain -> 'gain of the excitation'.
			#trigger -> 'trigger' }
]

{ #category : 'faust' }
PhStrike class >> argumentNames [

	^ #( #strikePosition #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
PhStrike class >> faustName [

	^ 'strike'
]

{ #category : 'accessing' }
PhStrike >> gain [

	^ gain
]

{ #category : 'accessing' }
PhStrike >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrike >> gate [

	"alias of trigger (older Phausto name)"

	^ trigger
]

{ #category : 'accessing' }
PhStrike >> gate: aNumberOrABoxOrASymbol [

	"alias of trigger: (older Phausto name)"

	self trigger: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhStrike >> initializeArguments [

	strikePosition := PhHSlider new
			label: self label , 'StrikePosition'
			values: #( 0.5 0 1 0.01 ).
	strikeSharpness := PhHSlider new
			label: self label , 'StrikeSharpness'
			values: #( 0.5 0.001 1 0.001 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhStrike >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
PhStrike >> strikePosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrike >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
PhStrike >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrike >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhStrike >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
