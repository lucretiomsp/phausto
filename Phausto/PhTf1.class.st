"
First-order digital filter, direct form (fi.tf1): H(z) = (b0 + b1 z^-1) / (1 + a1 z^-1)
"
Class {
	#name : 'PhTf1',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf1 >> asBox [

	^ self b0 asBox , self b1 asBox , self a1 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf1 >> initialize [

	super initialize.
	processExpression := 'process = fi.tf1;'.
	b0 := PhHSlider new label: self label , 'B0' values: #( 0.5 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0.5 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 0 -2 2 0.001 )
]
