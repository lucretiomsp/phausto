Class {
	#name : #BoxParallelComposition,
	#superclass : #BoxCombinator,
	#category : #'Phaust-Boxes'
}

{ #category : #accessing }
BoxParallelComposition >> numberOfInputs [

	^ left numberOfInputs + right numberOfInputs
]

{ #category : #accessing }
BoxParallelComposition >> numberOfOutputs [

	^ left numberOfOutputs + right numberOfOutputs
]

{ #category : #'code generation' }
BoxParallelComposition >> operatorString [
	
	^ ','
]
