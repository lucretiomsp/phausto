"
First-order ADAA hyperbolic saturator.

The domain of this function is ℝ; its theoretical range is [-2.0/3.0; 2.0/3.0].


"
Class {
	#name : 'Hyperbolic',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Hyperbolic >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Hyperbolic >> initialize [

	super initialize.
	processExpression :='process = aa.hyperbolic;'.
	
	
]
