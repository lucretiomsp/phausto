"
Second order normalized digital waveguide resonator (fi.nlf2).
"
Class {
	#name : 'PhNlf2',
	#superclass : 'PhWaveguideResonator',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhNlf2 >> initialize [

	super initialize.
	processExpression := 'process = fi.nlf2;'
]
