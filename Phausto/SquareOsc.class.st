"
Alias-suppressed square wave oscillator. Based on the Square Faust standard function.
## Parameters:

freq: frequency in Hz
"
Class {
	#name : 'SquareOsc',
	#superclass : 'Oscillator',
	#instVars : [
		'cpx'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
SquareOsc >> initialize [

	super initialize.
	processExpression :=  'process = os.square;'
]
