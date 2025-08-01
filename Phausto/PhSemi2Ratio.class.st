"
Converts semitones in a frequency multiplicative ratio.

##Parameter
**semitone:** number of semitones
"
Class {
	#name : 'PhSemi2Ratio',
	#superclass : 'PhConversionTool',
	#instVars : [
		'semitone'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhSemi2Ratio >> asBox [ 

self semitone asBox connectTo: super asBox.
]

{ #category : 'initialization' }
PhSemi2Ratio >> initialize [ 

super initialize .
semitone := 12.
processExpression := 'process = ba.semi2ratio;'
]

{ #category : 'accessing' }
PhSemi2Ratio >> semitone [

^ semitone
]
