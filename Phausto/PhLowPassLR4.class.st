"
4th-order Linkwitz-Riley lowpass (fi.lowpassLR4).

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhLowPassLR4',
	#superclass : 'PhLinkwitzRileyFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLowPassLR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.lowpassLR4;'
]
