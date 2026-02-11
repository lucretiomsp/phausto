"
Second-order ADAA parabolic saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'Parabolic2',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
Parabolic2 >> initialize [

	super initialize.
	processExpression :='process = aa.parabolic2;'.
	
	
]
