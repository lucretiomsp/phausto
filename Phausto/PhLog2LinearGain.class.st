"
Converts a log gain (0-1) to a linear gain (0-1).

##Parameter

**gain:** the log gain
"
Class {
	#name : 'PhLog2LinearGain',
	#superclass : 'PhConversionTool',
	#instVars : [
		'gain'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhLog2LinearGain >> asBox [

	self gain asBox connectTo: super asBox
]

{ #category : 'converting' }
PhLog2LinearGain >> gain [

^ gain
]

{ #category : 'initialization' }
PhLog2LinearGain >> initialize [

	super initialize.
	gain := 1.
	processExpression := 'process = ba.log2LinGain;'
]
