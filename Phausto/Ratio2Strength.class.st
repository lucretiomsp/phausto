"
Converts a ratio to a strength.
"
Class {
	#name : 'Ratio2Strength',
	#superclass : 'UnitGenerator',
	#instVars : [
		'ratio'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
Ratio2Strength >> asBox [ 

^ self ratio asBox connectTo: super asBox
]

{ #category : 'initialization' }
Ratio2Strength >> initialize [

	super initialize.
	ratio := 4.
	processExpression := 'process = co.ratio2strength;'
]

{ #category : 'accessing' }
Ratio2Strength >> ratio [ 
^ ratio
]
