"
linear-to-dB value converter. It can be used to convert a linear gain ]0-N] to an amplitude in dB.
More about [decibels](https://en.wikipedia.org/wiki/Decibel)


##Parameter
**gain:** a linear gain

"
Class {
	#name : 'PhLinear2Db',
	#superclass : 'PhConversionTool',
	#instVars : [
		'gain'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'converting' }
PhLinear2Db >> asBox [ 

^ self gain asBox  connectTo: super asBox
]

{ #category : 'accessing' }
PhLinear2Db >> gain [ 
^ gain
]

{ #category : 'initialization' }
PhLinear2Db >> initialize [

	super initialize.
	gain := 1.

	processExpression := 'process = ba.linear2db;'
]
