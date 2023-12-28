Class {
	#name : #BoxRecursiveComposition,
	#superclass : #BoxCombinator,
	#category : #'Phaust-Boxes'
}

{ #category : #accessing }
BoxRecursiveComposition >> numberOfInputs [

	^ left numberOfInputs - right numberOfInputs
]

{ #category : #accessing }
BoxRecursiveComposition >> numberOfOutputs [
	
	^ left numberOfOutputs
]

{ #category : #'code generation' }
BoxRecursiveComposition >> operatorString [

	^ '~'
]

{ #category : #validation }
BoxRecursiveComposition >> validate [

	"O(A) >= I(B)
	I(A) >= O(B)
	O(A~B) = O(A)
	I(A~B) = I(A) - I(B)"

	(left numberOfOutputs >= right numberOfInputs and: [
		 left numberOfInputs >= right numberOfOutputs ]) ifFalse: [ 
		FaustInputOutputMismatch signal: 'toto' ]
]
