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

	| intermediateBox finalBox |
	
	intermediateBox := super asBox .
	finalBox := freq asBox connectTo: intermediateBox .
^ finalBox
]

{ #category : #initialization }
SquareOsc >> initialize [

	super initialize.
	code := self importStatement , 'process = os.square;'
]
