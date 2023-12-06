Class {
	#name : #BoxMerge,
	#superclass : #BoxCombinator,
	#category : #'Phaust-Boxes'
}

{ #category : #'code generation' }
BoxMerge >> operatorString [

	^ ':>'
]

{ #category : #validation }
BoxMerge >> validate [

	"The number of outputs in the left should be a multiple of the number of inputs of the right"
	(left numberOfOutputs \\ right numberOfInputs) == 0
		ifFalse: [ FaustInputOutputMismatch signal ]
]
