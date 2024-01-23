"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
"
Class {
	#name : #SquareOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
SquareOsc >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = os.square(440);'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
