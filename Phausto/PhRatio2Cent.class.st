"
Converts a frequency multiplicative ratio in semitone cents.
##Parameter

**ratio:** frequence multiplicative in ratio
"
Class {
	#name : 'PhRatio2Cent',
	#superclass : 'PhConversionTool',
	#instVars : [
		'ratio'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhRatio2Cent >> asBox [ 

^ self ratio asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhRatio2Cent >> initialize [

	super initialize.
	ratio := 1.
	processExpression := 'ba.ratio2cent;'
]

{ #category : 'accessing' }
PhRatio2Cent >> ratio [ 

^ ratio
]
