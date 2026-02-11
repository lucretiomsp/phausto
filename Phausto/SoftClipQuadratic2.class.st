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

{ #category : 'initialization' }
SoftClipQuadratic2 >> initialize [

	super initialize.
	processExpression :='process = aa.softclipQuadratic2;'.
	
	
]
