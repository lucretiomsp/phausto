"
First-order low shelf filter (fi.low_shelf1).

**level:** gain (dB) between dc and freq (boost > 0, cut < 0)
**freq:** transition frequency (Hz)
"
Class {
	#name : 'PhLowShelf1',
	#superclass : 'PhLowShelf',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLowShelf1 >> initialize [

	super initialize.
	processExpression := 'process = fi.low_shelf1;'
]
