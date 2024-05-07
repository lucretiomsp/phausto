"
Simple resonant bandpass filters based on tf2s (virtual analog).
"
Class {
	#name : #ResonBp,
	#superclass : #ResonatorFilter,
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #initialization }
ResonBp >> initialize [

	super initialize.
	self processExpression: 'process = resonbp;'
]
