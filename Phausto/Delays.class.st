"
A collection of delays from Faust delays.lib.
[More](https://ccrma.stanford.edu/realsimple/Delay/Delay_lines.html) about delays and their use for audio effets ans synthesis algorithms

"
Class {
	#name : 'Delays',
	#superclass : 'UnitGenerator',
	#instVars : [
		'maxDelayLength',
		'delayLength',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Delays >> delayLength [

	^ delayLength ifNil: [ delayLength := (PhHSlider new
			 label: self label , 'Length'
			 init: 20050
			 min: 1
			 max: 44100
			 step: 1). ]
]

{ #category : 'accessing' }
Delays >> delayLength: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
Delays >> initialize [

	super initialize.
	maxDelayLength := 44100. "by default, maximum delay length is 1 second at 44100 Hz sample rate"

	input := Wire new
]

{ #category : 'accessing' }
Delays >> input [

	^ input
]

{ #category : 'accessing' }
Delays >> input: aFloatOrABox [

	input := aFloatOrABox
]

{ #category : 'accessing' }
Delays >> maxDelayLength [

	^ maxDelayLength
]

{ #category : 'accessing' }
Delays >> maxDelayLength: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'connecting' }
Delays >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]
