"
Order 6 elliptic bandpass filter (fi.bandpass6e).

**fl:** lower band-edge frequency (Hz)
**fu:** upper band-edge frequency (Hz)
"
Class {
	#name : 'PhBandPass6e',
	#superclass : 'PhBandFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhBandPass6e >> initialize [

	super initialize.
	processExpression := 'process = fi.bandpass6e;'
]
