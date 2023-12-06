Class {
	#name : #BoxSplit,
	#superclass : #BoxCombinator,
	#category : #'Phaust-Boxes'
}

{ #category : #'code generation' }
BoxSplit >> operatorString [
	
	^ '<:'
]

{ #category : #accessing }
BoxSplit >> validate [

	"The number of inputs in the right should be a multiple of the number of outputs of the left"
	(right numberOfInputs \\ left numberOfOutputs) == 0
		ifFalse: [ FaustInputOutputMismatch signal ]
]
