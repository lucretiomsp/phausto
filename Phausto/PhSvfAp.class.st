"
Allpass SVF (fi.svf.ap)
"
Class {
	#name : 'PhSvfAp',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfAp >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.ap;'
]
