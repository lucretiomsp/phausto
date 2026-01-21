"
Closes the inputs of a bidirectional chain in all directions.
"
Class {
	#name : 'CloseIns',
	#superclass : 'PhPmOutElement',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
CloseIns >> asBox [ 

^ super asBox
]

{ #category : 'initialization' }
CloseIns >> initialize [

	super initialize.
	processExpression := 'process = pm.closeIns;'
]
