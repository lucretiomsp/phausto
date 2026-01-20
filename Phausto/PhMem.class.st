"
A 1 sample delay. 
"
Class {
	#name : 'PhMem',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhMem >> asBox [ 

^ super asBox
]

{ #category : 'initialization' }
PhMem >> initialize [

	super initialize.
	processExpression := 'process = mem;'
]
