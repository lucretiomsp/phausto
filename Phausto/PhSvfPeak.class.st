"
Peak  SVF filter
"
Class {
	#name : 'PhSvfPeak',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfPeak >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.peak;'
]
