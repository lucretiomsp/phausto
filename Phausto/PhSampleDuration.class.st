"
Current sample duration in seconds computed from the sampling rate given at init time. Constant during program execution.
"
Class {
	#name : 'PhSampleDuration',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhSampleDuration >> initialize [

	super initialize.
	self processExpression: 'process = ma.T;'
]
