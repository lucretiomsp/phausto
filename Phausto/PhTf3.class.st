"
Third-order digital filter, direct form (fi.tf3)
"
Class {
	#name : 'PhTf3',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf3 >> asBox [

	^ self b0 asBox , self b1 asBox , self b2 asBox , self b3 asBox , self a1 asBox , self a2 asBox , self a3 asBox
	  , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhTf3 >> initialize [

	super initialize.
	processExpression := 'process = fi.tf3;'.
	b0 := PhHSlider new label: self label , 'B0' values: #( 0.125 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0.375 -2 2 0.001 ).
	b2 := PhHSlider new label: self label , 'B2' values: #( 0.375 -2 2 0.001 ).
	b3 := PhHSlider new label: self label , 'B3' values: #( 0.125 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 0 -2 2 0.001 ).
	a2 := PhHSlider new label: self label , 'A2' values: #( 0 -2 2 0.001 ).
	a3 := PhHSlider new label: self label , 'A3' values: #( 0 -2 2 0.001 )
]
