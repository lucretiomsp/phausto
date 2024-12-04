"
First-order ADAA sin(atan()) saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'SinArcTan',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SinArcTan >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SinArcTan >> initialize [

	super initialize.
	processExpression :='process = aa.sinatan;'.
	
	
]
