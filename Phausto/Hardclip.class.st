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

{ #category : 'converting' }
Hardclip >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Hardclip >> initialize [

	super initialize.
	processExpression :='process = aa.hardclip;'.
	
	
]
