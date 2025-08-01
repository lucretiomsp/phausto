"
Converts semitone cents in a frequency multiplicative ratio.
##Parameter

**cent:** number of cents
"
Class {
	#name : 'PhCent2Ratio',
	#superclass : 'PhConversionTool',
	#instVars : [
		'cent'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhCent2Ratio >> asBox [ 

^ self cent asBox connectTo: super asBox.
]

{ #category : 'accessing' }
PhCent2Ratio >> cent [
^ cent
]

{ #category : 'accessing' }
PhCent2Ratio >> initialize [ 

super initialize .
cent := 100.
processExpression := 'process = ba.cent2ratio;'
]
