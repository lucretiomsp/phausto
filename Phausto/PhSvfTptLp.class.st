"
Lowpass TPT state-variable filter (fi.SVFTPT.LP2)
"
Class {
	#name : 'PhSvfTptLp',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptLp >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.LP2;'
]
