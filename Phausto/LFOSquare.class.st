"
Zero-mean unit-amplitude LFO square wave withrange -1 1.

## Parameters:

- **freq: frequency in Hz
"
Class {
	#name : 'LFOSquare',
	#superclass : 'LFO',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSquare >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewave;'
]
