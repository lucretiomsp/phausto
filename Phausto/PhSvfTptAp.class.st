"
Allpass TPT state-variable filter (fi.SVFTPT.AP2)
"
Class {
	#name : 'PhSvfTptAp',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptAp >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.AP2;'
]
