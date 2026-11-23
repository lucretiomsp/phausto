"
Bandpass TPT state-variable filter (fi.SVFTPT.BP2)
"
Class {
	#name : 'PhSvfTptBp',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptBp >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.BP2;'
]
