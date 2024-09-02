"
Pulses generated at period in seconds
"
Class {
	#name : 'Pulse',
	#superclass : 'UnitGenerator',
	#instVars : [
		'period'
	],
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
Pulse >> asBox [

	| intermediateBox periodInSamples finalBox |
	intermediateBox := super asBox.

	periodInSamples := (Sec2Samples new value: self period) asBox.
	finalBox := periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Pulse >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse;'.


]

{ #category : 'accessing' }
Pulse >> period [

	^ period ifNil: [   PhHSlider new
		        label: self label , 'Period'
		        init: 1
		        min: 0.01
		        max: 10
		        step: 0.01 ]
]

{ #category : 'accessing' }
Pulse >> period: aNumberOrABox [

	period := aNumberOrABox isNumber
		        ifTrue: [ self period init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ].
]
