"
Current sampling rate given at init time. Constant during program execution.
"
Class {
	#name : #PhSampleRate,
	#superclass : #UnitGenerators,
	#category : #'Phausto-Math'
}

{ #category : #initialization }
PhSampleRate >> initialize [

	super initialize.
	self processExpression: 'process =  ba.sec2samp;'.
]
