"
Creates a filtered noise excitation


## Parameters

- **hPcutoff**: highpass cutoff frequency
- **lPcutoff**: lowpass cutoff frequency
- **strikeSharpness**: sharpness of the attack and release (0-1)
- **gain**: gain of the excitation
- **trigger**: a gate button/trigger signal (0/1)
"
Class {
	#name : 'PhStrikeModel',
	#superclass : 'Exciter',
	#instVars : [
		'hpCutoff',
		'lpCutoff',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhStrikeModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#hpCutoff -> 'highpass cutoff frequency'.
			#lpCutoff -> 'lowpass cutoff frequency'.
			#strikeSharpness -> 'sharpness of the attack and release (0-1)'.
			#gain -> 'gain of the excitation'.
			#trigger -> 'trigger' }
]

{ #category : 'faust' }
PhStrikeModel class >> argumentNames [

	^ #( #hpCutoff #lpCutoff #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
PhStrikeModel class >> faustName [

	^ 'strikeModel'
]

{ #category : 'accessing' }
PhStrikeModel >> gain [

	^ gain
]

{ #category : 'accessing' }
PhStrikeModel >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrikeModel >> gate [

	"alias of trigger (older Phausto name)"

	^ trigger
]

{ #category : 'accessing' }
PhStrikeModel >> gate: aNumberOrABoxOrASymbol [

	"alias of trigger: (older Phausto name)"

	self trigger: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrikeModel >> hpCutoff [

	^ hpCutoff
]

{ #category : 'accessing' }
PhStrikeModel >> hpCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhStrikeModel >> initializeArguments [

	hpCutoff := PhHSlider new
			label: self label , 'HpCutoff'
			values: #( 700 20 7000 1 ).
	lpCutoff := PhHSlider new
			label: self label , 'LpCutoff'
			values: #( 7000 20 20000 1 ).
	strikeSharpness := PhHSlider new
			label: self label , 'StrikeSharpness'
			values: #( 0.5 0.001 1 0.001 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhStrikeModel >> lpCutoff [

	^ lpCutoff
]

{ #category : 'accessing' }
PhStrikeModel >> lpCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrikeModel >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
PhStrikeModel >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStrikeModel >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhStrikeModel >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
