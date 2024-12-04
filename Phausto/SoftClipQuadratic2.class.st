"
Second-order ADAA quadratic softclip.

The domain of this function is ℝ; its theoretical range is [-1.0; 1.0].


"
Class {
	#name : 'SoftClipQuadratic2',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SoftClipQuadratic2 >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SoftClipQuadratic2 >> initialize [

	super initialize.
	processExpression :='process = aa.softclipQuadratic2;'.
	
	
]
