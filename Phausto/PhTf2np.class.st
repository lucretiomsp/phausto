"
Biquad based on a stable second-order normalized ladder filter (fi.tf2np). Keep the poles stable: |a2| < 1 and |a1| < 1 + a2.
"
Class {
	#name : 'PhTf2np',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf2np >> asBox [

	^ self b0 asBox , self b1 asBox , self b2 asBox , self a1 asBox , self a2 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf2np >> initialize [

	super initialize.
	processExpression := 'process = fi.tf2np;'.
	b0 := PhHSlider new label: self label , 'B0' values: #( 0.25 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0.5 -2 2 0.001 ).
	b2 := PhHSlider new label: self label , 'B2' values: #( 0.25 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 0 -2 2 0.001 ).
	a2 := PhHSlider new label: self label , 'A2' values: #( 0 -2 2 0.001 )
]
