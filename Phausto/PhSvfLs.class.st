"
Low shelf SVF with a gain in dB (fi.svf.ls)
"
Class {
	#name : 'PhSvfLs',
	#superclass : 'PhSvfGainFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfLs >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.ls;'
]
