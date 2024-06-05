"
Positive unit-amplitude LF triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTriPos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
LFOTriPos >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : #initialization }
LFOTriPos >> initialize [ 
super initialize .
processExpression := 'process = os.lf_trianglepos;'
]
