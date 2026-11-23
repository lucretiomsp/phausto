"
Difference of an order 3 Butterworth highpass and lowpass of the same cutoff, computed as a single filter (fi.highpass_minus_lowpass): the result is an allpass, only the phase changes around the cutoff.

**cutoff:** crossover frequency (Hz)
"
Class {
	#name : 'PhHighPassMinusLowPass',
	#superclass : 'ButterworthLPHP',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhHighPassMinusLowPass >> asBox [

	^ self cutoff asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhHighPassMinusLowPass >> initialize [

	super initialize.
	processExpression := 'process = fi.highpass_minus_lowpass(3);'
]
