"
DX7 function for a specific algorithm at compile-time. This function comes with a GUI and is MIDI-compatible.
"
Class {
	#name : 'Dx7Algorithm',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'converting' }
Dx7Algorithm >> asBox [ 
^ self code asBox
]

{ #category : 'initialization' }
Dx7Algorithm >> initialize [ 

super initialize .
processExpression := 'process = dx7.algorithm;'
]
