"
Positive unit-amplitude LF triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTriPos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LFOTriPos >> initialize [ 
super initialize .
processExpression := 'process = os.lf_trianglepos;'
]
