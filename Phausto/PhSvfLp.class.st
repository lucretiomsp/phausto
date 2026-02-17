"
Lowpass SVF
"
Class {
	#name : 'PhSvfLp',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfLp >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.lp;'.
	
]
