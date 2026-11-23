"
Highpass TPT state-variable filter (fi.SVFTPT.HP2)
"
Class {
	#name : 'PhSvfTptHp',
	#superclass : 'PhSvfTpt',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfTptHp >> initialize [

	super initialize.
	processExpression := 'process = fi.SVFTPT.HP2;'
]
