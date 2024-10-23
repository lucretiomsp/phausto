"
Simple resonant bandpass filters based on tf2s (virtual analog).
"
Class {
	#name : 'ResonBp',
	#superclass : 'ResonatorFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
ResonBp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonbp;'
]
