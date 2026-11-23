"
Third-order analog filter digitized by the bilinear transform, low-frequency case (fi.tf3slf): H(s) = (b3 s^3 + b2 s^2 + b1 s + b0) / (a3 s^3 + a2 s^2 + a1 s + a0)
"
Class {
	#name : 'PhTf3slf',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf3slf >> asBox [

	^ self b3 asBox , self b2 asBox , self b1 asBox , self b0 asBox , self a3 asBox , self a2 asBox , self a1 asBox , self a0 asBox
	  , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf3slf >> initialize [

	super initialize.
	processExpression := 'process = fi.tf3slf;'.
	b3 := PhHSlider new label: self label , 'B3' values: #( 0 -2 2 0.001 ).
	b2 := PhHSlider new label: self label , 'B2' values: #( 0 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0 -2 2 0.001 ).
	b0 := PhHSlider new label: self label , 'B0' values: #( 1 -2 2 0.001 ).
	a3 := PhHSlider new label: self label , 'A3' values: #( 0 -2 2 0.001 ).
	a2 := PhHSlider new label: self label , 'A2' values: #( 0 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 0 -2 2 0.001 ).
	a0 := PhHSlider new label: self label , 'A0' values: #( 1 -2 2 0.001 )
]
