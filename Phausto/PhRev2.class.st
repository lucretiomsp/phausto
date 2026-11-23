"
Allpass comb filter used in the Schroeder reverberators (fi.rev2 = allpass_comb(maxlen,len,-g)).

**maxDel:** maximum delay (a power of 2)
**intDel:** current (integer) delay in samples
**aN:** allpass gain
"
Class {
	#name : 'PhRev2',
	#superclass : 'Allpass_Comb',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhRev2 >> initialize [

	super initialize.
	processExpression := 'process = fi.rev2;'.
	aN := PhHSlider new label: self label , 'AN' values: #( 0.7 0 0.999 0.001 )
]
