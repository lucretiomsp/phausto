Class {
	#name : 'PhIsNan',
	#superclass : 'UnitGenerator',
	#instVars : [
		'signal',
		'input'
	],
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'converting' }
PhIsNan >> asBox [ 

self input , self signal connectTo: super asBox
]

{ #category : 'initialization' }
PhIsNan >> initialize [
Error new signal: 'This class cannot be created in this compilation mode. Check Faust reference manual'.
	super initialize.
	signal := 1.
	input := 1.
	processExpression := 'process = isnan;'
]

{ #category : 'accessing' }
PhIsNan >> input [ 

^ input
]

{ #category : 'accessing' }
PhIsNan >> signal [ 


^ signal
]

{ #category : 'accessing' }
PhIsNan >> signal: aUnitGenerator [

	signal := aUnitGenerator 
]
