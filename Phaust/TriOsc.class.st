"
Alias-suppressed triangle wave oscillator. Based on os.triangle Faust standard function
"
Class {
	#name : #TriOsc,
	#superclass : #Oscillators,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
TriOsc >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox .
	finalBox := freq asBox connectTo: intermediateBox .
^ finalBox
]

{ #category : #initialization }
TriOsc >> initialize [

	super initialize.
	code := self importStatement  , 'process = os.sawtooth;'
]
