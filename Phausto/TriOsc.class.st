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

{ #category : 'initialization' }
TriOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
