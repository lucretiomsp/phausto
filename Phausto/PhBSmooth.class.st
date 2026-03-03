"
Block smooth linear interpolation during a block of samples (given by the ma.BS value).
"
Class {
	#name : 'PhBSmooth',
	#superclass : 'PhSmoo',
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhBSmooth >> initialize [ 
super initialize .
processExpression := 'process = si.bsmooth;'
]
