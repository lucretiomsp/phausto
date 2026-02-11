"
Second-order ADAA hyperbolic saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'Hyperbolic2',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
Hyperbolic2 >> initialize [

	super initialize.
	processExpression :='process = aa.hyperbolic2;'.
	
	
]
