"
Empty bidirectional block to be used with _chain_ :  3 signals ins and 3 signals out.
"
Class {
	#name : 'PhBasicBlock',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
PhBasicBlock >> asBox [

	^ super asBox
]

{ #category : 'initialization' }
PhBasicBlock >> initialize [

	super initialize.
	processExpression := 'process = pm.basicBlock;'.
	
]
