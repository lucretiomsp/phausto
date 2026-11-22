"
String instrument model with a modular body (see modeInterpRes and <https://ccrma.stanford.edu/~rmichon/3dPrintingModeling/>).

Faust: `pm.modularInterpStringModel(stringLength, pluckPosition, shape, scale, bodyExcitation, stringExcitation)` (0 in / 1 out)

## Parameters

- **stringLength**: the length of the string in meters
- **pluckPosition**: pluck position (0-1) (1 is on the bridge)
- **shape**: shape of the resonator (0: square, 1: square with rounded corners, 2: round)
- **scale**: scale of the resonator (0: small, 1: medium, 2: large)
- **bodyExcitation**: excitation signal for the body
- **stringExcitation**: excitation signal for the string

## Example

```language=Pharo
dsp := PhModularInterpStringModel new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhModularInterpStringModel',
	#superclass : 'StringInstruments',
	#instVars : [
		'stringLength',
		'pluckPosition',
		'shape',
		'scale',
		'bodyExcitation',
		'stringExcitation'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhModularInterpStringModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stringLength -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#shape -> 'shape of the resonator (0: square, 1: square with rounded corners, 2: round)'.
			#scale -> 'scale of the resonator (0: small, 1: medium, 2: large)'.
			#bodyExcitation -> 'excitation signal for the body'.
			#stringExcitation -> 'excitation signal for the string' }
]

{ #category : 'faust' }
PhModularInterpStringModel class >> argumentNames [

	^ #( #stringLength #pluckPosition #shape #scale #bodyExcitation #stringExcitation )
]

{ #category : 'faust' }
PhModularInterpStringModel class >> faustName [

	^ 'modularInterpStringModel'
]

{ #category : 'accessing' }
PhModularInterpStringModel >> bodyExcitation [

	^ bodyExcitation
]

{ #category : 'accessing' }
PhModularInterpStringModel >> bodyExcitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhModularInterpStringModel >> initializeArguments [

	stringLength := PhHSlider new
			label: self label , 'StringLength'
			values: #( 0.8 0.01 2 0.01 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.3 0.01 0.99 0.01 ).
	shape := PhHSlider new
			label: self label , 'Shape'
			values: #( 1 0 2 0.01 ).
	scale := PhHSlider new
			label: self label , 'Scale'
			values: #( 1 0 2 0.01 ).
	bodyExcitation := PhImpulseExcitation new.
	stringExcitation := PhImpulseExcitation new
]

{ #category : 'accessing' }
PhModularInterpStringModel >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhModularInterpStringModel >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpStringModel >> scale [

	^ scale
]

{ #category : 'accessing' }
PhModularInterpStringModel >> scale: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpStringModel >> shape [

	^ shape
]

{ #category : 'accessing' }
PhModularInterpStringModel >> shape: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpStringModel >> stringExcitation [

	^ stringExcitation
]

{ #category : 'accessing' }
PhModularInterpStringModel >> stringExcitation: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpStringModel >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
PhModularInterpStringModel >> stringLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
