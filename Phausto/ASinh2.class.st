"
Second-order ADAA asinh() saturator (unbounded).

The domain of this function is ℝ; its theoretical range is ℝ.


"
Class {
	#name : 'ASinh2',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
ASinh2 >> initialize [

	super initialize.
	processExpression :='process = aa.asinh2;'.
	
	
]
