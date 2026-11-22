"
A virtual blower creating a _DC signal_ with some breath noise in it.

## Parameters

- **pressure**: pressure (0-1)
- **breathGain**: breath noise gain (0-1) (recommended: 0.005)
- **breathCutoff**: breath cuttoff frequency (Hz) (recommended: 2000)
"
Class {
	#name : 'PhBlower',
	#superclass : 'Exciter',
	#instVars : [
		'pressure',
		'breathGain',
		'breathCutoff',
		'vibratoFreq',
		'vibratoGain'
	],
	#category : 'Phausto-PhysModels - Exciters',
	#package : 'Phausto',
	#tag : 'PhysModels - Exciters'
}

{ #category : 'faust' }
PhBlower class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#pressure -> 'pressure (0-1)'.
			#breathGain -> 'breath noise gain (0-1) (recommended: 0.005)'.
			#breathCutoff -> 'breath cuttoff frequency (Hz) (recommended: 2000)'.
			#vibratoFreq -> 'vibratoFreq'.
			#vibratoGain -> 'vibratoGain' }
]

{ #category : 'faust' }
PhBlower class >> argumentNames [

	^ #( #pressure #breathGain #breathCutoff #vibratoFreq #vibratoGain )
]

{ #category : 'faust' }
PhBlower class >> faustName [

	^ 'blower'
]

{ #category : 'accessing' }
PhBlower >> breathCutoff [

	^ breathCutoff
]

{ #category : 'accessing' }
PhBlower >> breathCutoff: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBlower >> breathGain [

	^ breathGain
]

{ #category : 'accessing' }
PhBlower >> breathGain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhBlower >> initializeArguments [

	pressure := PhButton new label: self label , 'Pressure'.
	breathGain := PhHSlider new
			label: self label , 'BreathGain'
			values: #( 0.005 0 1 0.001 ).
	breathCutoff := PhHSlider new
			label: self label , 'BreathCutoff'
			values: #( 2000 20 20000 1 ).
	vibratoFreq := PhHSlider new
			label: self label , 'VibratoFreq'
			values: #( 5 0.1 10 0.1 ).
	vibratoGain := PhHSlider new
			label: self label , 'VibratoGain'
			values: #( 0.01 0 0.1 0.001 )
]

{ #category : 'accessing' }
PhBlower >> pressure [

	^ pressure
]

{ #category : 'accessing' }
PhBlower >> pressure: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBlower >> vibratoFreq [

	^ vibratoFreq
]

{ #category : 'accessing' }
PhBlower >> vibratoFreq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBlower >> vibratoGain [

	^ vibratoGain
]

{ #category : 'accessing' }
PhBlower >> vibratoGain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
