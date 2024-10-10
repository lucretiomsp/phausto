"
Converts a frequency in hertz to length in meters.


"
Class {
	#name : 'F2l',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
F2l >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := self freq  connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
F2l >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Freq'
			          init: 440
			          min: 20
			          max: 1200
			          step: 1 ]
]

{ #category : 'accessing' }
F2l >> freq: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]

{ #category : 'initialization' }
F2l >> initialize [

	super initialize.
	processExpression := 'process = pm.f2l;'
]
