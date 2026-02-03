"
Wave-Table-Based Cosine wave oscillator.
"
Class {
	#name : 'OscSin',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
OscSin >> initialize [

	super initialize.
	processExpression := 'process =os.oscsin;'
]
