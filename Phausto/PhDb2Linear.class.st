"
dB-to-linear value converter. 
It can be used to convert an amplitude in dB to a linear gain ]0-N.
Learn more about [decibels](https://en.wikipedia.org/wiki/Decibel)
##Parameter
**amplitude:** amplitude in decibel.
"
Class {
	#name : 'PhDb2Linear',
	#superclass : 'PhConversionTool',
	#instVars : [
		'amplitude'
	],
	#category : 'Phausto-Basics - ConversionTools',
	#package : 'Phausto',
	#tag : 'Basics - ConversionTools'
}

{ #category : 'accessing' }
PhDb2Linear >> amplitude [ 
^ amplitude
]

{ #category : 'converting' }
PhDb2Linear >> asBox [

	^ self amplitude asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhDb2Linear >> initialize [

	super initialize.
	amplitude := 1.

	processExpression := 'process = ba.db2linear;'
]
