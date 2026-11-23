"
First-order high shelf filter with a linear gain (fi.high_shelf1_l).

**level:** linear gain between freq and SR/2 (boost > 1, cut < 1)
**freq:** transition frequency (Hz)
"
Class {
	#name : 'PhHighShelf1L',
	#superclass : 'PhHighShelf',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhHighShelf1L >> initialize [

	super initialize.
	processExpression := 'process = fi.high_shelf1_l;'.
	level := PhHSlider new label: self label , 'Level' values: #( 2 0 4 0.01 )
]
