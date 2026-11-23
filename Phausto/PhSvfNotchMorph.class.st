"
SVF-based notch filter that morphs smoothly between lowpass, notch and highpass (fi.svf_notch_morph).

**frequency:** cutoff frequency (Hz)
**q:** quality factor
**blend:** 0 = lowpass, 1 = notch, 2 = highpass
"
Class {
	#name : 'PhSvfNotchMorph',
	#superclass : 'PhSvfMorph',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfNotchMorph >> initialize [

	super initialize.
	processExpression := 'process = fi.svf_notch_morph;'
]
