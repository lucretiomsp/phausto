"
Creates terminations on both sides of a chain without closing the inputs and outputs of the bidirectional signals chain. As for chain, this function adds a 1 sample delay to the bidirectional signal, both ways. Of course, this function can be nested within a chain.
"
Class {
	#name : 'PhTerminations',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'initialization' }
PhTerminations >> initialize [ 

super initialize .
processExpression := 'process = pm.terminations;'
]
