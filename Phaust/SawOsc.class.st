"
Alias-suppressed sawtooth oscillator, sawtooth is a standard Faust function.
"
Class {
	#name : #SawOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
SawOsc >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = os.sawtooth(440);'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
