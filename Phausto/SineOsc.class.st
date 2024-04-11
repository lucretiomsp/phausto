"
Default Sine wave oscillator, corresponding to Faust osc standard function
"
Class {
	#name : #SineOsc,
	#superclass : #Oscillators,
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #initialization }
SineOsc >> asBox [

	| intermediateBox finalBox freqBox |
	intermediateBox := super asBox.
	freqBox := freq asBox.
	finalBox := freqBox  connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
SineOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.osc;'
]
