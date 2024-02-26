"
Positive unit-amplitude LF triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTriPos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
LFOTriPos >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
LFOTriPos >> initialize [ 
super initialize .
processExpression := 'process = os.lf_trianglepos;'
]
