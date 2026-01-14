"
Creates a chain of bidirectional blocks. Blocks must have 3 inputs and outputs. The first input/output carry left going waves, the second input/output carry right going waves, and the third input/output is used to carry any potential output signal to the end of the algorithm.
"
Class {
	#name : 'PhChain',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
PhChain >> asBox [

	| inputBox |
	inputBox := PhBasicBlock new asBox connectTo: PhBasicBlock new asBox.
	^ inputBox connectTo: super asBox
]

{ #category : 'initialization' }
PhChain >> initialize [

	super initialize.
	self initializeProcessExpression.
	self processExpression: 'process = pm.chain;'
]

{ #category : 'initialization' }
PhChain >> initializeProcessExpression [
	"this class needs a more complex process expression as Structural parameters in Faust must be integer constant numerical expressions, are evaluated at compile time and cannot flow through wires or be infix"


]
