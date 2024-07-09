"
Select between 4 inputs, starts counting at 0
"
Class {
	#name : 'PhSelect4',
	#superclass : 'PhBox',
	#instVars : [
		'index'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhSelect4 >> asBox [

	| code intermediateBox |
	BoxAPI uniqueInstance createLibContext.
	code := 'import("stdfaust.lib"); process = _ , _ , _ , _ , _: ba.selectn(4) ;'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: code
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	^ intermediateBox
]

{ #category : 'initialization' }
PhSelect4 >> initialize [ 
super initialize
]
