"
Empty bidirectional block to be used with _chain_ :  3 signals ins and 3 signals out.
"
Class {
	#name : 'PhBasicBlock',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input1',
		'input2',
		'input3'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
PhBasicBlock >> asBox [ 

^ self input1 asBox , self input2 asBox , self input3 asBox connectTo: super asBox.
]

{ #category : 'initialization' }
PhBasicBlock >> initialize [

	super initialize.
	processExpression := 'process = pm.basicBlock;' .
	input1 := 0.
	input2 := 0.
	input3 := 0
]

{ #category : 'accessing' }
PhBasicBlock >> input1 [ 
^ input1
]

{ #category : 'accessing' }
PhBasicBlock >> input2 [

	^ input2
]

{ #category : 'accessing' }
PhBasicBlock >> input3 [

	^ input3
]
