"
Nth-order Butterworth highpass filter
"
Class {
	#name : 'HighPass',
	#superclass : 'ButterworthLPHP',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
HighPass >> initialize [

	super initialize.
	self processExpression: 'process = fi.highpass(4);'
]
