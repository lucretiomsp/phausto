"
A linear ramp with a slope of '(+/-)1/n' samples to reach the next target value.

## Parameters
**input:** increment the ramp when > 0 , decrement when < 0 , reset the ramp when equals to 0.
**n:** number of samples to increment/decrement the value by one
"
Class {
	#name : 'PhRamp',
	#superclass : 'UnitGenerator',
	#instVars : [
		'n',
		'input'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
PhRamp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhRamp >> initialize [

	super initialize.
	processExpression := 'process = ba.ramp;'.
	n := PhHSlider new
		     label: self label , 'N'
		     init: 1
		     min: 1
		     max: 88200
		     step: 1.
	input := PhButton new label: self label , 'Gate'.
]

{ #category : 'as yet unclassified' }
PhRamp >> input [

	^ input 
]

{ #category : 'as yet unclassified' }
PhRamp >> n [

	^ n 
]
