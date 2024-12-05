"
First-order ADAA sin().

The domain of this function is ℝ; its theoretical range is ℝ.


"
Class {
	#name : 'AASine',
	#superclass : 'Trigonometry',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
AASine >> initialize [

	super initialize.
	processExpression :='process = aa.sine;'.
	
	
]
