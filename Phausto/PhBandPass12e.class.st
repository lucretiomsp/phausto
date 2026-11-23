"
Order 12 elliptic bandpass filter (fi.bandpass12e), steeper than bandpass6e.

**fl:** lower band-edge frequency (Hz)
**fu:** upper band-edge frequency (Hz)
"
Class {
	#name : 'PhBandPass12e',
	#superclass : 'PhBandFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhBandPass12e >> initialize [

	super initialize.
	processExpression := 'process = fi.bandpass12e;'
]
