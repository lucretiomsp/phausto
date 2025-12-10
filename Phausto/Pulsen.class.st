"
Ggenerator of _pulses_ with **length** and **period** in seconds
"
Class {
	#name : 'Pulsen',
	#superclass : 'UnitGenerator',
	#instVars : [
		'length',
		'period'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
Pulsen >> asBox [

	| intermediateBox lengthInSamples periodInSamples finalBox |
	intermediateBox := super asBox.
	lengthInSamples := (PhSec2Samp new duration: self length) asBox.
	periodInSamples := (PhSec2Samp new duration: self period) asBox.
	finalBox := lengthInSamples , periodInSamples connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Pulsen >> initialize [

	super initialize.
	processExpression := 'process = ba.pulsen;'.
	length := PhHSlider new
		          label: self label , 'Length'
		          init: 0.1
		          min: 0.01
		          max: 2
		          step: 0.01.

	period := PhHSlider new
		          label: self label , 'Period'
		          init: 1
		          min: 0.01
		          max: 2
		          step: 0.01
]

{ #category : 'accessing' }
Pulsen >> length [

	^ length 
]

{ #category : 'accessing' }
Pulsen >> period [

	^ period 
]
