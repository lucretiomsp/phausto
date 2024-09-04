"
Zero-mean unit-amplitude LF square wave.
"
Class {
	#name : 'LFOSquare',
	#superclass : 'LowFrequencyOscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSquare >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewave;'
]
