"
Second-order ADAA sin().

The domain of this function is ℝ; its theoretical range is ℝ.
"
Class {
	#name : 'AASine2',
	#superclass : 'Trigonometry',
	#category : 'Phausto-Antialiased',
	#package : 'Phausto',
	#tag : 'Antialiased'
}

{ #category : 'initialization' }
AASine2 >> initialize [

	super initialize.
	processExpression :='process = aa.sine2;'.
	
	
]
