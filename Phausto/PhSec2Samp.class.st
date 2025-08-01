"
Converts a duration in seconds to a number of samples at the current sampling rate
## Parameters
**duration:** duration in seconds
"
Class {
	#name : 'PhSec2Samp',
	#superclass : 'PhConversionTool',
	#instVars : [
		'duration'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhSec2Samp >> asBox [ 

^ self duration asBox connectTo: super asBox.
]

{ #category : 'accessing' }
PhSec2Samp >> duration [

^ duration
]

{ #category : 'initialization' }
PhSec2Samp >> initialize [

	super initialize.
	duration := 1.
	processExpression := 'process = ba.sec2samp;'
]
