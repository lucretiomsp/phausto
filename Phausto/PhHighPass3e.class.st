"
Third-order elliptic (Cauer) highpass filter (fi.highpass3e). Inversion of lowpass3e with respect to the cutoff frequency.

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhHighPass3e',
	#superclass : 'PhEllipticFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhHighPass3e >> initialize [

	super initialize.
	processExpression := 'process = fi.highpass3e;'
]
