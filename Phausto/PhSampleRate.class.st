"
Current sampling rate given at init time. Constant during program execution.
"
Class {
	#name : 'PhSampleRate',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'initialization' }
PhSampleRate >> initialize [

	super initialize.
	self processExpression: 'process = aa.' , self class name ,  ';'
]
