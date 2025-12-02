"
First-order ADAA sin().

The domain of this function is ℝ; its theoretical range is ℝ.


"
Class {
	#name : 'AASine',
	#superclass : 'Trigonometry',
	#category : 'Phausto-Antialiased',
	#package : 'Phausto',
	#tag : 'Antialiased'
}

{ #category : 'initialization' }
AASine >> initialize [

	super initialize.
	processExpression :='process = aa.sine;'.
	
	
]
