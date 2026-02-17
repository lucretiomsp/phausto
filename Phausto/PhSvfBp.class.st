"
Bandpass SVF
"
Class {
	#name : 'PhSvfBp',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfBp >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.bp;'
]
