"
Converts a ratio to a strength.
"
Class {
	#name : 'Strength2Ratio',
	#superclass : 'UnitGenerator',
	#instVars : [
		'strength'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
Strength2Ratio >> asBox [

	^ self strength asBox connectTo: super asBox
]

{ #category : 'initialization' }
Strength2Ratio >> initialize [

	super initialize.
	strength := 4.
	processExpression := 'process = co.strength2ratio;'
]

{ #category : 'accessing' }
Strength2Ratio >> strength [ 

^ strength
]
