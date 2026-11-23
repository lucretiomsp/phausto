"
The prefilter (K-weighting) of the ITU-R BS.1770-4 loudness measurement (fi.itu_r_bs_1770_4_kfilter), normalised to 0 dB at 997 Hz.
"
Class {
	#name : 'PhKFilter',
	#superclass : 'PhFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhKFilter >> asBox [

	^ self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhKFilter >> initialize [

	super initialize.
	processExpression := 'process = fi.itu_r_bs_1770_4_kfilter;'
]
