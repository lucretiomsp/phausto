"
First-order ADAA parabolic saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'Parabolic',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Parabolic >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Parabolic >> initialize [

	super initialize.
	processExpression :='process = aa.parabolic;'.
	
	
]
