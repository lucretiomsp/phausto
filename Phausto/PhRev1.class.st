"
Feedback comb filter used in the Schroeder reverberators (fi.rev1 = fb_comb(maxdel,N,1,-g)).

**maxDel:** maximum delay (a power of 2)
**intDel:** current (integer) delay in samples
**g:** feedback gain
"
Class {
	#name : 'PhRev1',
	#superclass : 'FbCombFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhRev1 >> initialize [

	super initialize.
	processExpression := 'process = fi.rev1;'.
	g := PhHSlider new label: self label , 'G' values: #( 0.7 0 0.999 0.001 )
]
