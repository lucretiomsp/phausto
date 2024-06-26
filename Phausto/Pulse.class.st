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

	| intermediateBox lengthInSamples periodInSamples finalBox |
	intermediateBox := super asBox.

	periodInSamples := (Sec2Samples new value: period) asBox.
	finalBox := lengthInSamples , periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : #initialization }
Pulse >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse;'.

	self period: 1
]

{ #category : #accessing }
Pulse >> period [

	^ period
]

{ #category : #accessing }
Pulse >> period: aPeriod [

	period := aPeriod asBox
]
