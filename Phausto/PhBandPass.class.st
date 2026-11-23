"
Order 4 (Nh = 2) Butterworth bandpass filter (fi.bandpass), made of a highpass at fl and a lowpass at fu.

**fl:** lower -3dB frequency (Hz)
**fu:** upper -3dB frequency (Hz)
"
Class {
	#name : 'PhBandPass',
	#superclass : 'PhBandFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhBandPass >> initialize [

	super initialize.
	processExpression := 'process = fi.bandpass(2);'
]
