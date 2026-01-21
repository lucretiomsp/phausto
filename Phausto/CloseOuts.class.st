"
Closes the outputs of a bidirectional chain in all directions except for the main signal output (3d output).
"
Class {
	#name : 'CloseOuts',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
CloseOuts >> asBox [ 

^ self inputBlock asBox connectTo: super asBox 
]

{ #category : 'initialization' }
CloseOuts >> initialize [ 

super initialize .
processExpression := 'process = pm.closeOuts;'
]
