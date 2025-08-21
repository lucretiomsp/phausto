"
Converts a linear gain (0-1) to a log gain (0-1).

##Parameter
**gain:** the linear gain
"
Class {
	#name : 'PhLinear2LogGain',
	#superclass : 'PhConversionTool',
	#instVars : [
		'gain'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhLinear2LogGain >> asBox [

	^ self gain asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhLinear2LogGain >> gain [ 

^ gain
]

{ #category : 'initialization' }
PhLinear2LogGain >> initialize [ 

super initialize .
gain:= 1.
processExpression := 'process = ba.lin2LogGain;'
]
