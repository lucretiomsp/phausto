"
Notch TPT state-variable filter (fi.SVFTPT.Notch2)
"
Class {
	#name : 'PhSvfTptNotch',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptNotch >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.Notch2;'
]
