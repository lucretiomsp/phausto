"
Length in meters to frequency.
"
Class {
	#name : 'PhL2f',
	#superclass : 'UnitGenerator',
	#instVars : [
		'length'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'accessing' }
PhL2f >> asBox [ 

^ self length asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhL2f >> initialize [

	super initialize.
	processExpression := 'process = pm.f2l;'.
	length := 1
]

{ #category : 'accessing' }
PhL2f >> length [ 

^ length
]
