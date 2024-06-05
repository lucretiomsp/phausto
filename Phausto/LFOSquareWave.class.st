"
Zero-mean unit-amplitude LF square wave.
"
Class {
	#name : #LFOSquareWave,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LFOSquareWave >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewave;'
]
