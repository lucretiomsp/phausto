"
Positive LF square wave in [0,1]
"
Class {
	#name : #LFOSquareWavePos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LFOSquareWavePos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewavepos;'
]
