"
Order 4 (Nh = 2) Butterworth bandstop filter (fi.bandstop).

**fl:** lower -3dB frequency (Hz)
**fu:** upper -3dB frequency (Hz)
"
Class {
	#name : 'PhBandStop',
	#superclass : 'PhBandFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhBandStop >> initialize [

	super initialize.
	processExpression := 'process = fi.bandstop(2);'
]
