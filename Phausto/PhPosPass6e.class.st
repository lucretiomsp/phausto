"
Positive-pass filter based on a 6th-order elliptic lowpass (fi.pospass6e): keeps only the positive frequencies of the input.
It has 1 input and 2 outputs, the real and imaginary parts of the complex output.

**cutoff:** cutoff frequency (Hz) of the positive-frequency band
"
Class {
	#name : 'PhPosPass6e',
	#superclass : 'PhEllipticFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhPosPass6e >> initialize [

	super initialize.
	processExpression := 'process = fi.pospass6e;'
]
