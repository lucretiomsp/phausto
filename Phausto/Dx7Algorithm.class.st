"
DX7 function for a specific algorithm at compile-time. This function comes with a GUI and is MIDI-compatible.
"
Class {
	#name : 'Dx7Algorithm',
	#superclass : 'UnitGenerator',
	#instVars : [
		'algorithm'
	],
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'initialization' }
Dx7Algorithm >> algorithm: anInteger [

"algorithm identifier (1 -32)"
algorithm := anInteger. 
processExpression := 'process = dx7.algorithm(' , algorithm , ');'
]

{ #category : 'converting' }
Dx7Algorithm >> asBox [ 
^ self code asBox
]

{ #category : 'initialization' }
Dx7Algorithm >> initialize [

	super initialize.
	algorithm := 1 asString.
	importStatement := 'dx = library("dx7/dx7.lib");'.
	processExpression := 'process = dx.algorithm(' , algorithm , ');'
]
