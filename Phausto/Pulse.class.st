"
Pulses generated at period in seconds
"
Class {
	#name : #Pulse,
	#superclass : #UnitGenerators,
	#instVars : [
		'period'
	],
	#category : #'Phausto-BoxAPI-Basics'
}

{ #category : #converting }
Pulse >> asBox [

	| intermediateBox periodInSamples finalBox |
	intermediateBox := super asBox.

	periodInSamples := (Sec2Samples new value: period) asBox.
	finalBox := periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : #initialization }
Pulse >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse;'.

	self period: (PhHSlider new
		          label: self label , 'Period'
		          init: 1
		          min: 0.001
		          max: 8
		          step: 0.01)
]

{ #category : #accessing }
Pulse >> period [

	^ period
]

{ #category : #accessing }
Pulse >> period: aPeriod [

	period := aPeriod asBox
]
