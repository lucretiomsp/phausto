"
Bidirectional block implementing a modular string instrument resonator (see modeInterpRes).

Faust: `pm.modularInterpBody(nModes, shape, scale)` (3 in / 3 out)

## Parameters

- **nModes**: number of modeled modes (40 max) _(compile-time constant: give me a Number)_
- **shape**: shape of the resonator (0: square, 1: square with rounded corners, 2: round)
- **scale**: scale of the resonator (0: small, 1: medium, 2: large)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhModularInterpBody new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhModularInterpBody',
	#superclass : 'PhPmElement',
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
PhModularInterpBody class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#nModes -> 'number of modeled modes (40 max)'.
			#shape -> 'shape of the resonator (0: square, 1: square with rounded corners, 2: round)'.
			#scale -> 'scale of the resonator (0: small, 1: medium, 2: large)' }
]

{ #category : 'faust' }
PhModularInterpBody class >> argumentNames [

	^ #( #nModes #shape #scale )
]

{ #category : 'faust' }
PhModularInterpBody class >> faustName [

	^ 'modularInterpBody'
]

{ #category : 'initialization' }
PhModularInterpBody >> initializeArguments [

	nModes := 20.
	shape := PhHSlider new
			label: self label , 'Shape'
			values: #( 1 0 2 0.01 ).
	scale := PhHSlider new
			label: self label , 'Scale'
			values: #( 1 0 2 0.01 )
]

{ #category : 'accessing' }
PhModularInterpBody >> nModes [

	^ nModes
]

{ #category : 'accessing' }
PhModularInterpBody >> nModes: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpBody >> scale [

	^ scale
]

{ #category : 'accessing' }
PhModularInterpBody >> scale: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModularInterpBody >> shape [

	^ shape
]

{ #category : 'accessing' }
PhModularInterpBody >> shape: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
