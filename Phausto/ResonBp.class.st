"
Simple resonant bandpass filters based on tf2s (virtual analog).
"
Class {
	#name : #ResonBp,
	#superclass : #ResonatorFilter,
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #converting }
ResonBp >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self frequency , self q , self gain , self input
		            connectTo: intermdiateBox.
		
	^ finalBox
]

{ #category : #initialization }
ResonBp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonbp;'
]
