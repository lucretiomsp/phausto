"
Alias-suppressed triangle wave oscillator. Based on os.triangle Faust standard function
"
Class {
	#name : 'TriOsc',
	#superclass : 'Oscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
TriOsc >> asBox [

	| intermediateBox finalBox |
	self initializeUIParameters.
	intermediateBox := super asBox.
	finalBox := self freq asBox connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'initialization' }
TriOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
