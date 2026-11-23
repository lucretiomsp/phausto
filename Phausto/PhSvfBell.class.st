"
Bell (peaking) SVF with a gain in dB (fi.svf.bell)
"
Class {
	#name : 'PhSvfBell',
	#superclass : 'PhSvfGainFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhSvfBell >> initialize [

	super initialize.
	processExpression := 'process = fi.svf.bell;'
]
