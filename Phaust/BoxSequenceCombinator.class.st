Class {
	#name : #BoxSequenceCombinator,
	#superclass : #BoxCombinator,
	#category : #'Phaust-Boxes'
}

{ #category : #accessing }
BoxSequenceCombinator >> numberOfInputs [
	
	^ left numberOfInputs
]

{ #category : #accessing }
BoxSequenceCombinator >> numberOfOutputs [
	
	^ right numberOfOutputs
]

{ #category : #'code generation' }
BoxSequenceCombinator >> operatorString [

	^ ':'
]
