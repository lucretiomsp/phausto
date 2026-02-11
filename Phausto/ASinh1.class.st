"
First-order ADAA asinh() saturator (unbounded).

The domain of this function is ℝ; its theoretical range is ℝ.


"
Class {
	#name : 'ASinh1',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
ASinh1 >> initialize [

	super initialize.
	processExpression :='process = aa.asinh1;'.
	
	
]
