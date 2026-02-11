"
One-pole lowpass with a T60 time constant (60 dB attenuation after tN seconds).

"
Class {
	#name : 'PhLpT60',
	#superclass : 'PhLpTau',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLpT60 >> initialize [

	super initialize.
	processExpression := 'process = fi.lpt60(0.3);'
]
