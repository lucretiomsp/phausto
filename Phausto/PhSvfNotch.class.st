"
Bandpass SVF
"
Class {
	#name : 'PhSvfNotch',
	#superclass : 'PhStateVariableFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfNotch >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.notch;'
]
