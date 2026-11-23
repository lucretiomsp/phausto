"
Peaking TPT state-variable filter (fi.SVFTPT.Peaking2)
"
Class {
	#name : 'PhSvfTptPeaking',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptPeaking >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.Peaking2;'
]
