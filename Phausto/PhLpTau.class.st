"
One-pole lowpass with a tau time constant (1/e attenuation after tN seconds).
"
Class {
	#name : 'PhLpTau',
	#superclass : 'PhFilter',
	#instVars : [
		'tN'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLpTau >> asBox [ 

^ self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhLpTau >> initialize [

	super initialize.
	processExpression := 'process = fi.lptau(0.1);'
]

{ #category : 'accessing' }
PhLpTau >> tN [ 

^ tN
]

{ #category : 'accessing' }
PhLpTau >> tN: aTimeInSeconds [

	tN := aTimeInSeconds.

	self updateProcessExpressionWith: aTimeInSeconds 
]
