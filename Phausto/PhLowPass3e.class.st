"
Third-order elliptic (Cauer) lowpass filter (fi.lowpass3e).
Stopband starts near 1.5 x cutoff, about -70 dB.

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhLowPass3e',
	#superclass : 'PhEllipticFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLowPass3e >> initialize [

	super initialize.
	processExpression := 'process = fi.lowpass3e;'
]
