"
First-order low shelf filter with a linear gain (fi.low_shelf1_l).

**level:** linear gain between dc and freq (boost > 1, cut < 1)
**freq:** transition frequency (Hz)
"
Class {
	#name : 'PhLowShelf1L',
	#superclass : 'PhLowShelf',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLowShelf1L >> initialize [

	super initialize.
	processExpression := 'process = fi.low_shelf1_l;'.
	level := PhHSlider new label: self label , 'Level' values: #( 2 0 4 0.01 )
]
