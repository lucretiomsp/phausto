"
One-pole lowpass with a T19 time constant (approx. 19 dB attenuation after tN seconds).
"
Class {
	#name : 'PhLpT19',
	#superclass : 'PhLpTau',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhLpT19 >> initialize [ 
super initialize .
processExpression := 'process = fi.lpt19(0.2);'
]
