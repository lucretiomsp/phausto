"
Second-order analog filter digitized by the bilinear transform (fi.tf2s): H(s) = (b2 s^2 + b1 s + b0) / (s^2 + a1 s + a0), s normalized by w1. Defaults: Butterworth lowpass at 1 kHz.
"
Class {
	#name : 'PhTf2s',
	#superclass : 'PhTransferFunction',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhTf2s >> asBox [

	^ self b2 asBox , self b1 asBox , self b0 asBox , self a1 asBox , self a0 asBox , self w1 asBox , self input asBox connectTo:
		  self code asBox
]

{ #category : 'initialization' }
PhTf2s >> initialize [

	super initialize.
	processExpression := 'process = fi.tf2s;'.
	b2 := PhHSlider new label: self label , 'B2' values: #( 0 -2 2 0.001 ).
	b1 := PhHSlider new label: self label , 'B1' values: #( 0 -2 2 0.001 ).
	b0 := PhHSlider new label: self label , 'B0' values: #( 1 -2 2 0.001 ).
	a1 := PhHSlider new label: self label , 'A1' values: #( 1.414 -2 2 0.001 ).
	a0 := PhHSlider new label: self label , 'A0' values: #( 1 -2 2 0.001 ).
	w1 := PhHSlider new label: self label , 'W1' values: #( 6283 1 100000 1 )
]
