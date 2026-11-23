"
Second-order transformer-normalized digital waveguide resonator (fi.wgr).
"
Class {
	#name : 'PhWgr',
	#superclass : 'PhWaveguideResonator',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhWgr >> initialize [

	super initialize.
	processExpression := 'process = fi.wgr;'
]
