"
Pulses (generator of length n generated at period p.
"
Class {
	#name : #Pulsen,
	#superclass : #UnitGenerator,
	#instVars : [
		'length',
		'period'
	],
	#category : #'Phausto-BoxAPI-Basics'
}

{ #category : #converting }
Pulsen >> asBox [

	| intermediateBox lengthInSamples periodInSamples finalBox |
	intermediateBox := super asBox.
	lengthInSamples := (Sec2Samples new value: length) asBox.
	periodInSamples := (Sec2Samples new value: period) asBox.
	finalBox := lengthInSamples , periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : #initialization }
Pulsen >> initialize [

	super initialize.
	processExpression := 'process = ba.pulsen;'.
	self length: 0.01.
	self period: (PhHSlider new
			 label: self label , 'Period'
			 init: 1
			 min: 0.001
			 max: 8
			 step: 0.01)
]

{ #category : #accessing }
Pulsen >> length [

	^ length
]

{ #category : #accessing }
Pulsen >> length: anObject [

	length := anObject asBox 
]

{ #category : #accessing }
Pulsen >> period [

	^ period
]

{ #category : #accessing }
Pulsen >> period: anObject [

	period := anObject asBox
]
