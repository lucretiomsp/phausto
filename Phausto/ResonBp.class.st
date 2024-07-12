"
Simple resonant bandpass filters based on tf2s (virtual analog).
"
Class {
	#name : 'ResonBp',
	#superclass : 'ResonatorFilter',
	#category : 'Phausto-BoxAPI-Filters',
	#package : 'Phausto',
	#tag : 'BoxAPI-Filters'
}

{ #category : 'initialization' }
ResonBp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonbp;'
]
