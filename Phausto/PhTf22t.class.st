"
Biquad, transposed direct form II (fi.tf22t)
"
Class {
	#name : 'PhTf22t',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf22t >> asBox [

	^ self b0 asBox , self b1 asBox , self b2 asBox , self a1 asBox , self a2 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf22t >> initialize [

	super initialize.
	processExpression := 'process = fi.tf22t;'.
	b0 := PhHSlider new label: self label , 'B0' values: #( 0.25 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0.5 -2 2 0.001 ).
	b2 := PhHSlider new label: self label , 'B2' values: #( 0.25 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 0 -2 2 0.001 ).
	a2 := PhHSlider new label: self label , 'A2' values: #( 0 -2 2 0.001 )
]
