"
Positive LF square wave in [0,1]
"
Class {
	#name : 'LFOSquarePos',
	#superclass : 'LowFrequencyOscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOSquarePos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewavepos;'
]
