"
A Faust Button, value is 1 when clicked, otherwise value is 0
"
Class {
	#name : #PhButton,
	#superclass : #UIGenerators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
PhButton >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = button("justGate");'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
