"
Converts a frequency multiplicative ratio in semitones.
##Parameter

**ratio:** frequence multiplicative in ratio
"
Class {
	#name : 'PhRatio2Semitone',
	#superclass : 'PhConversionTool',
	#instVars : [
		'ratio'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhRatio2Semitone >> asBox [ 
^ self ratio asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhRatio2Semitone >> initialize [

	super initialize.
	ratio := 1.
	processExpression := 'process = ba.ratio2semi;'
]

{ #category : 'converting' }
PhRatio2Semitone >> ratio [ 
^ ratio 
]
