"
First-order analog filter digitized by the bilinear transform (fi.tf1s): H(s) = (b1 s + b0) / (s + a0), s normalized by w1
"
Class {
	#name : 'PhTf1s',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf1s >> asBox [

	^ self b1 asBox , self b0 asBox , self a0 asBox , self w1 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf1s >> initialize [

	super initialize.
	processExpression := 'process = fi.tf1s;'.
	b1 := PhHSlider new label: self label , 'B1' values: #( 0 -2 2 0.001 ).
	b0 := PhHSlider new label: self label , 'B0' values: #( 1 -2 2 0.001 ).
	a0 := PhHSlider new label: self label , 'A0' values: #( 1 -2 2 0.001 ).
	w1 := PhHSlider new label: self label , 'W1' values: #( 6283 1 100000 1 )
]
