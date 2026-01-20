"
Length in meters to number of samples
"
Class {
	#name : 'PhL2s',
	#superclass : 'UnitGenerator',
	#instVars : [
		'length'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'accessing' }
PhL2s >> asBox [ 

^ self length asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhL2s >> initialize [

	super initialize.
	processExpression := 'process = pm.l2s;'.
	length := 1
]

{ #category : 'accessing' }
PhL2s >> length [ 

^ length
]
