"
First-order ADAA cubic saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'Cubic1',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Cubic1 >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Cubic1 >> initialize [

	super initialize.
	processExpression :='process = aa.cubic1;'.
	
	
]
