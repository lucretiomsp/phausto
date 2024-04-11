"
Alias-suppressed sawtooth oscillator, sawtooth is a standard Faust function.
"
Class {
	#name : #SawOsc,
	#superclass : #Oscillators,
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #converting }
SawOsc >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox .
	finalBox := freq asBox connectTo: intermediateBox .
^ finalBox
]

{ #category : #initialization }
SawOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.saw;'
]
