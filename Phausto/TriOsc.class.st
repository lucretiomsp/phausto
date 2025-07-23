"
Alias-suppressed triangle wave oscillator. Based on os.triangle Faust standard function
"
Class {
	#name : 'TriOsc',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
TriOsc >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox connectTo: intermediateBox.
	^ finalBox * self uLevel asBox
]

{ #category : 'initialization' }
TriOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
