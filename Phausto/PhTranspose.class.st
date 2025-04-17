"
A simple pitch shifter based on 2 delay lines. transpose is a standard Faust function.

Parameters

window: the window length (samples)
crossfade: crossfade duration duration (samples)
shift: shift (semitones)
"
Class {
	#name : 'PhTranspose',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input',
		'window',
		'crossfade',
		'shift'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhTranspose >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self window asBox
	            , self crossfade asBox , self shift , self input asBox  asBox connectTo:
		            intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
PhTranspose >> crossfade [

	^ crossfade ifNil: [ crossfade := 256 asBox ]
]

{ #category : 'initialization' }
PhTranspose >> initialize [

	super initialize.
	processExpression := 'process = ef.transpose;'
]

{ #category : 'accessing' }
PhTranspose >> input [

	^ input ifNil: [ input := 0 asBox ]
]

{ #category : 'connecting' }
PhTranspose >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]

{ #category : 'accessing' }
PhTranspose >> shift [

	^ shift ifNil: [
		  shift := PhHSlider new
			             label: self class name , 'Shift'
			             init: 0
			             min: -24
			             max: 24
			             step: 1 ]
]

{ #category : 'accessing' }
PhTranspose >> window [

	^ window ifNil: [ window := 256 asBox ]
]
