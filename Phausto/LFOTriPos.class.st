"
Positive unit-amplitude LF triangle wave from the Faust Standard Library
"
Class {
	#name : 'LFOTriPos',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOTriPos >> initialize [ 
super initialize .
processExpression := 'process = os.lf_trianglepos;'
]
