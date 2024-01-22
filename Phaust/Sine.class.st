"
Default Sine wave oscillator, corresponding to Faust osc standard function
"
Class {
	#name : #Sine,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
Sine >> initialize [

	| box code|
	
box := BoxAPI uniqueInstance boxFromString:  code inputs: self inputs  outputs: self outputs buffer: self errorBuffer   arguments: 'ciao'
]
