"
Modular string instrument resonator based on IR measurements made on 3D printed models. The 2D space allowing for the control of the shape and the scale of the model is enabled by interpolating between modes parameters. More information about this technique/project can be found here: <https://ccrma.stanford.edu/~rmichon/3dPrintingModeling/>.

Faust: `pm.modeInterpRes(nModes, x, y)` (1 in / 1 out)

## Parameters

- **nModes**: number of modeled modes (40 max) _(compile-time constant: give me a Number)_
- **shape**: shape of the resonator (0: square, 1: square with rounded corners, 2: round)
- **scale**: scale of the resonator (0: small, 1: medium, 2: large)

## Example

```language=Pharo
(PhModeInterpRes new input: PhImpulseExcitation new) stereo asDsp
```
"
Class {
	#name : 'PhModeInterpRes',
	#superclass : 'PhPmFunction',
	#instVars : [
		'nModes',
		'shape',
		'scale'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhModeInterpRes class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#nModes -> 'number of modeled modes (40 max)'.
			#shape -> 'shape of the resonator (0: square, 1: square with rounded corners, 2: round)'.
			#scale -> 'scale of the resonator (0: small, 1: medium, 2: large)' }
]

{ #category : 'faust' }
PhModeInterpRes class >> argumentNames [

	^ #( #nModes #shape #scale )
]

{ #category : 'faust' }
PhModeInterpRes class >> faustName [

	^ 'modeInterpRes'
]

{ #category : 'initialization' }
PhModeInterpRes >> initializeArguments [

	nModes := 20.
	shape := PhHSlider new
			label: self label , 'Shape'
			values: #( 1 0 2 0.01 ).
	scale := PhHSlider new
			label: self label , 'Scale'
			values: #( 1 0 2 0.01 )
]

{ #category : 'accessing' }
PhModeInterpRes >> nModes [

	^ nModes
]

{ #category : 'accessing' }
PhModeInterpRes >> nModes: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModeInterpRes >> scale [

	^ scale
]

{ #category : 'accessing' }
PhModeInterpRes >> scale: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModeInterpRes >> shape [

	^ shape
]

{ #category : 'accessing' }
PhModeInterpRes >> shape: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
