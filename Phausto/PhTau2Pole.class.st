"
Returns a real pole giving exponential decay. Note that t60 (time to decay 60 dB) is ~6.91 time constants.

##Parameter

**tau:** time-constant in seconds
"
Class {
	#name : 'PhTau2Pole',
	#superclass : 'PhConversionTool',
	#instVars : [
		'tau'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhTau2Pole >> asBox [ 

^ self tau asBox connectTo: super asBox
]

{ #category : 'accessing' }
PhTau2Pole >> initialize [

	super initialize.
	tau :=1.
	processExpression := 'process = ba.tau2pole;'
]

{ #category : 'accessing' }
PhTau2Pole >> tau [ 

^ tau
]
