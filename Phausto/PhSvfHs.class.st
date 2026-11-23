"
High shelf SVF with a gain in dB (fi.svf.hs)
"
Class {
	#name : 'PhSvfHs',
	#superclass : 'PhSvfGainFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfHs >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.hs;'
]
