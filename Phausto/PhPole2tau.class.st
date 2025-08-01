"
Returns the time-constant, in seconds, corresponding to the given real, positive pole in (0-1).
The function is typically used in scenarios where you need to analyze or design a system's response characteristics. By converting a pole position to a time constant, you can better understand how fast the system will react to inputs or how quickly it will reach a steady state.

##Parameter

**pole:** the pole
"
Class {
	#name : 'PhPole2tau',
	#superclass : 'PhConversionTool',
	#instVars : [
		'pole'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhPole2tau >> asBox [ 

self pole asBox connectTo: super asBox
]

{ #category : 'converting' }
PhPole2tau >> initialize [

	super initialize.
   pole := 0.
	processExpression := 'process = ba.pole2tau;'
]

{ #category : 'accessing' }
PhPole2tau >> pole [ 

^ pole
]
