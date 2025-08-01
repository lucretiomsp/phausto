"
Converts a number of samples to a duration in seconds at the current sampling rate . 
## Parameters
**duration:** duration in seconds
"
Class {
	#name : 'PhSamp2Sec',
	#superclass : 'PhConversionTool',
	#instVars : [
		'duration'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhSamp2Sec >> asBox [

	^ self duration asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhSamp2Sec >> duration [

^ duration
]

{ #category : 'initialization' }
PhSamp2Sec >> initialize [

	super initialize.
	duration := 44100.

	processExpression := 'process = ba.samp2sec;'
]
