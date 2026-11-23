"
Normalised bandpass TPT state-variable filter (fi.SVFTPT.BP2Norm)
"
Class {
	#name : 'PhSvfTptBpNorm',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptBpNorm >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.BP2Norm;'
]
