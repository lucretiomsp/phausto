"
String instrument with a modular body (see modeInterpRes and <https://ccrma.stanford.edu/~rmichon/3dPrintingModeling/>).

Faust: `pm.modularInterpInstr(stringLength, pluckPosition, shape, scale, gain, tapBody, triggerString)` (0 in / 1 out)

## Parameters

- **stringLength**: the length of the string in meters
- **pluckPosition**: pluck position (0-1) (1 is on the bridge)
- **shape**: shape of the resonator (0: square, 1: square with rounded corners, 2: round)
- **scale**: scale of the resonator (0: small, 1: medium, 2: large)
- **gain**: of the string excitation
- **tapBody**: send an impulse in the body of the instrument where the string is connected (1 for on, 0 for off)
- **triggerString**: trigger signal for the string (1 for on, 0 for off)

## Example

```language=Pharo
dsp := PhModularInterpInstr new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhModularInterpInstr',
	#superclass : 'StringInstruments',
	#instVars : [
		'stringLength',
		'pluckPosition',
		'shape',
		'scale',
		'gain',
		'tapBody',
		'triggerString'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhModularInterpInstr class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stringLength -> 'the length of the string in meters'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#shape -> 'shape of the resonator (0: square, 1: square with rounded corners, 2: round)'.
			#scale -> 'scale of the resonator (0: small, 1: medium, 2: large)'.
			#gain -> 'of the string excitation'.
			#tapBody -> 'send an impulse in the body of the instrument where the string is connected (1 for on, 0 for off)'.
			#triggerString -> 'trigger signal for the string (1 for on, 0 for off)' }
]

{ #category : 'faust' }
PhModularInterpInstr class >> argumentNames [

	^ #( #stringLength #pluckPosition #shape #scale #gain #tapBody #triggerString )
]

{ #category : 'faust' }
PhModularInterpInstr class >> faustName [

	^ 'modularInterpInstr'
]

{ #category : 'accessing' }
PhModularInterpInstr >> gain [

	^ gain
]

{ #category : 'accessing' }
PhModularInterpInstr >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhModularInterpInstr >> initializeArguments [

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
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	tapBody := PhButton new label: self label , 'TapBody'.
	triggerString := PhButton new label: self label , 'TriggerString'
]

{ #category : 'accessing' }
PhModularInterpInstr >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
PhModularInterpInstr >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpInstr >> scale [

	^ scale
]

{ #category : 'accessing' }
PhModularInterpInstr >> scale: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpInstr >> shape [

	^ shape
]

{ #category : 'accessing' }
PhModularInterpInstr >> shape: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpInstr >> stringLength [

	^ stringLength
]

{ #category : 'accessing' }
PhModularInterpInstr >> stringLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpInstr >> tapBody [

	^ tapBody
]

{ #category : 'accessing' }
PhModularInterpInstr >> tapBody: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpInstr >> triggerString [

	^ triggerString
]

{ #category : 'accessing' }
PhModularInterpInstr >> triggerString: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
