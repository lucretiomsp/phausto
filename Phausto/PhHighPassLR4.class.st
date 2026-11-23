"
4th-order Linkwitz-Riley highpass (fi.highpassLR4).

**cutoff:** cutoff frequency (Hz)
"
Class {
	#name : 'PhHighPassLR4',
	#superclass : 'PhLinkwitzRileyFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhHighPassLR4 >> initialize [

	super initialize.
	processExpression := 'process = fi.highpassLR4;'
]
