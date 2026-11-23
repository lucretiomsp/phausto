"
First-order high shelf filter (fi.high_shelf1).

**level:** gain (dB) between freq and SR/2 (boost > 0, cut < 0)
**freq:** transition frequency (Hz)
"
Class {
	#name : 'PhHighShelf1',
	#superclass : 'PhHighShelf',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhHighShelf1 >> initialize [

	super initialize.
	processExpression := 'process = fi.high_shelf1;'
]
