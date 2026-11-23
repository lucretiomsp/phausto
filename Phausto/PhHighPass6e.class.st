"
Sixth-order elliptic (Cauer) highpass filter (fi.highpass6e). Inversion of lowpass6e with respect to the cutoff frequency.

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhHighPass6e',
	#superclass : 'PhEllipticFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhHighPass6e >> initialize [

	super initialize.
	processExpression := 'process = fi.highpass6e;'
]
