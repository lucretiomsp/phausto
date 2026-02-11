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

{ #category : 'initialization' }
Cubic1 >> initialize [

	super initialize.
	processExpression :='process = aa.cubic1;'.
	
	
]
