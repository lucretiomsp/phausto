"
First-order ADAA hard-clip.

The domain of this function is ℝ; its theoretical range is [-1.0; 1.0].


"
Class {
	#name : 'Hardclip',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
Hardclip >> initialize [

	super initialize.
	processExpression :='process = aa.hardclip;'.
	
	
]
