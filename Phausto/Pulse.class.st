"
Pulses generated at **period** in seconds
"
Class {
	#name : 'Pulse',
	#superclass : 'UnitGenerator',
	#instVars : [
		'period'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
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

	^ period ifNil: [
		  period := PhHSlider new
			            label: self label , 'Period'
			            init: 1
			            min: 0.1
			            max: 10
			            step: 0.01 ]
]
