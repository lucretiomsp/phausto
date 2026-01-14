"
Creates a chain of bidirectional blocks. Blocks must have 3 inputs and outputs. The first input/output carry left going waves, the second input/output carry right going waves, and the third input/output is used to carry any potential output signal to the end of the algorithm.
"
Class {
	#name : 'PhChain',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input1',
		'input2'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
PhChain >> asBox [

	"self buildProcessExpression."
	^ super asBox
]

{ #category : 'initialization' }
PhChain >> buildProcessExpression [

	| i1 i2 |
	i1 := self input1 asBox asString.
	i2 := self input2 asBox asString.

	processExpression := self  processExpression , i1 , ' : ' , i2 , ');'
]

{ #category : 'initialization' }
PhChain >> initialize [

	super initialize.

	self processExpression: 'process = pm.chain;'.
	input1 := PhBasicBlock new.
	input2 := PhBasicBlock new
]

{ #category : 'initialization' }
PhChain >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"

	processExpression := 'phChain (first , second) = pm.chain(first : second);
process = phChain (pm.basicBlock , pm.basicBlock);'
]

{ #category : 'converting' }
PhChain >> input1 [ 

^ input1 
]

{ #category : 'converting' }
PhChain >> input2 [

^ input2 
]
