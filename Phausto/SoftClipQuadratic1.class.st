"
First-order ADAA quadratic softclip.

The domain of this function is ℝ; its theoretical range is [-1.0; 1.0].


"
Class {
	#name : 'SoftClipQuadratic1',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SoftClipQuadratic1 >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SoftClipQuadratic1 >> initialize [

	super initialize.
	processExpression :='process = aa.softclipQuadratic1;'.
	
	
]
