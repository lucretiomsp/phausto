"
Phaust noise generators library, taken from Faust noises.lib
Creating an instance of this class generates a white noise.
"
Class {
	#name : #Noise,
	#superclass : #Box,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
Noise >> asBox [
	"generates white noise"

	| box code |
	code := 'import("stdfaust.lib"); process = no.noise;'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
	^ box
]
