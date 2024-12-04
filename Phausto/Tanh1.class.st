"
First-order ADAA tanh() saturator.

The domain of this function is ℝ; its theoretical range is [-1.0; 1.0].


"
Class {
	#name : 'Tanh1',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Tanh1 >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox :=  self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Tanh1 >> initialize [

	super initialize.
	processExpression :='process = aa.tanh1;'.
	
	
]
