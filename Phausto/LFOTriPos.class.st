"
Positive unit-amplitude LF triangle wave from the Faust Standard Library
"
Class {
	#name : 'LFOTriPos',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
LFOTriPos >> initialize [ 
super initialize .
processExpression := 'process = os.lf_trianglepos;'
]
