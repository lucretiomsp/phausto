"
Second-order ADAA sin().

The domain of this function is ℝ; its theoretical range is ℝ.
"
Class {
	#name : 'AASine2',
	#superclass : 'Trigonometry',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
AASine2 >> initialize [

	super initialize.
	processExpression :='process = aa.sine2;'.
	
	
]
