"
Creates a plucking excitation signal.

## Parameter

- **stringLength: length of the string to pluck
- **cutoff: cutoff ratio (1 for default)
- **maxFreq: max frequency ratio (1 for default)
- **strikeSharpness: sharpness of the attack and release (1 for default)
- **gain: gain of the excitation (0-1)
- **trigger**: trigger signal (1 for on, 0 for off)
"
Class {
	#name : 'PhPluckString',
	#superclass : 'Exciter',
	#instVars : [
		'stringLength',
		'cutoff',
		'maxFreq',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhPluckString class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stringLength -> 'length of the string to pluck'.
			#cutoff -> 'cutoff ratio (1 for default)'.
			#maxFreq -> 'max frequency ratio (1 for default)'.
			#strikeSharpness -> 'sharpness of the attack and release (1 for default)'.
			#gain -> 'gain of the excitation (0-1)'.
			#trigger -> 'trigger signal (1 for on, 0 for off)' }
]

{ #category : 'faust' }
PhPluckString class >> argumentNames [

	^ #( #stringLength #cutoff #maxFreq #strikeSharpness #gain #trigger )
]

{ #category : 'faust' }
PhPluckString class >> faustName [

	^ 'pluckString'
]

{ #category : 'accessing' }
PhPluckString >> cutoff [

	^ cutoff
]

{ #category : 'accessing' }
PhPluckString >> cutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhPluckString >> gain [

	^ gain
]

{ #category : 'accessing' }
PhPluckString >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhPluckString >> gate [

	"alias of trigger (older Phausto name)"

	^ trigger
]

{ #category : 'accessing' }
PhPluckString >> gate: aNumberOrABoxOrASymbol [

	"alias of trigger: (older Phausto name)"

	self trigger: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhPluckString >> initializeArguments [

	stringLength := PhHSlider new
			label: self label , 'StringLength'
			values: #( 0.8 0.01 2 0.01 ).
	cutoff := PhHSlider new
			label: self label , 'Cutoff'
			values: #( 1 0.1 10 0.01 ).
	maxFreq := PhHSlider new
			label: self label , 'MaxFreq'
			values: #( 1 0.1 10 0.01 ).
	strikeSharpness := PhHSlider new
			label: self label , 'StrikeSharpness'
			values: #( 1 0.01 5 0.01 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
PhPluckString >> maxFreq [

	^ maxFreq
]

{ #category : 'accessing' }
PhPluckString >> maxFreq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhPluckString >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
PhPluckString >> strikeSharpness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhPluckString >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
PhPluckString >> stringLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhPluckString >> trigger [

	^ trigger
]

{ #category : 'accessing' }
PhPluckString >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
