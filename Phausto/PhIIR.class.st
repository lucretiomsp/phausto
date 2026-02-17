"
Nth-order Infinite-Impulse-Response (IIR) digital filter, implemented in terms of the Transfer-Function (TF) coefficients. Such filter structures are termed ""direct form"".

##Parameters:

**bcoeffs:** (b0,b1,...,b_order) = TF numerator coefficients
**acoeffs:** (a1,...,a_order) = TF denominator coeffs (a0=1)

"
Class {
	#name : 'PhIIR',
	#superclass : 'PhFilter',
	#instVars : [
		'pole',
		'aCoeffs',
		'bCoeffs'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhIIR >> aCoeffs [
^ aCoeffs
]

{ #category : 'converting' }
PhIIR >> asBox [ 

^ self bCoeffs asBox , self aCoeffs asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhIIR >> bCoeffs [

	^ bCoeffs
]

{ #category : 'initialization' }
PhIIR >> initialize [ 
super initialize .
processExpression := 'process = fi.iir;'.
aCoeffs := PhHSlider new label: self label , 'ACoeffs' values: #(0.5 -2 2 0.01).
bCoeffs := PhHSlider new label: self label , 'BCoeffs' values: #(0.5 -2 2 0.01).
]
