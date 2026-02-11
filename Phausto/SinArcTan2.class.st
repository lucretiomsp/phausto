"
Second-order ADAA sin(atan()) saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'SinArcTan2',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'initialization' }
SinArcTan2 >> initialize [

	super initialize.
	processExpression :='process = aa.sinatan2;'.
	
	
]
