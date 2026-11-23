"
First-order analog lowpass prototype turned into a second-order bandpass, then digitized (fi.tf1sb)
"
Class {
	#name : 'PhTf1sb',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf1sb >> asBox [

	^ self b1 asBox , self b0 asBox , self a0 asBox , self w1 asBox , self wc asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf1sb >> initialize [

	super initialize.
	processExpression := 'process = fi.tf1sb;'.
	b1 := PhHSlider new label: self label , 'B1' values: #( 1 -2 2 0.001 ).
	b0 := PhHSlider new label: self label , 'B0' values: #( 0 -2 2 0.001 ).
	a0 := PhHSlider new label: self label , 'A0' values: #( 1 -2 2 0.001 ).
	w1 := PhHSlider new label: self label , 'W1' values: #( 6283 1 100000 1 ).
	wc := PhHSlider new label: self label , 'WC' values: #( 6283 1 100000 1 )
]
