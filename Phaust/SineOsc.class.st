"
Default Sine wave oscillator, corresponding to Faust osc standard function
"
Class {
	#name : #SineOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
SineOsc >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = os.osc('
	        , self freq asString , ');'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
