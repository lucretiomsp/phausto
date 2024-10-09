"
Pulses (generator of length n generated at period p.
"
Class {
	#name : 'Pulsen',
	#superclass : 'UnitGenerator',
	#instVars : [
		'length',
		'period'
	],
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
Pulsen >> asBox [

	| intermediateBox lengthInSamples periodInSamples finalBox |
	intermediateBox := super asBox.
	lengthInSamples := (Sec2Samples new value: self length) asBox.
	periodInSamples := (Sec2Samples new value: self period) asBox.
	finalBox := lengthInSamples , periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Pulsen >> initialize [

	super initialize.
	processExpression := 'process = ba.pulsen;'.

]

{ #category : 'accessing' }
Pulsen >> length [

	^ length ifNil: [
		  length := PhHSlider new
			            label: self label , 'Length'
			            init: 0.1
			            min: 0.01
			            max: 2
			            step: 0.01 ]
]

{ #category : 'accessing' }
Pulsen >> length: aNumberOrABox [

	length := aNumberOrABox isNumber
		        ifTrue: [ self length init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ].
]

{ #category : 'accessing' }
Pulsen >> period [

	^ period ifNil: [ period :=
		  PhHSlider new
			  label: self label , 'Period'
			  init: 1
			  min: 0.01
			  max: 2
			  step: 0.01 ]
]

{ #category : 'accessing' }
Pulsen >> period: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. 

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]
