"
Positive-pass filter based on an order 4 Butterworth lowpass (fi.pospass): keeps only the positive frequencies of the input.
It has 1 input and 2 outputs, the real and imaginary parts of the complex output.

**cutoff:** cutoff frequency (Hz) of the positive-frequency band
"
Class {
	#name : 'PhPosPass',
	#superclass : 'ButterworthLPHP',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhPosPass >> asBox [

	^ self cutoff asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhPosPass >> initialize [

	super initialize.
	processExpression := 'process = fi.pospass(4);'
]
