"
Sixth-order elliptic (Cauer) lowpass filter (fi.lowpass6e).
Steeper than lowpass3e, stopband about -80 dB.

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhLowPass6e',
	#superclass : 'PhEllipticFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLowPass6e >> initialize [

	super initialize.
	processExpression := 'process = fi.lowpass6e;'
]
