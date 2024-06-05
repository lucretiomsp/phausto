"
Positive LF square wave in [0,1]
"
Class {
	#name : #LFOSquareWavePos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
LFOSquareWavePos >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox.
]

{ #category : #initialization }
LFOSquareWavePos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewavepos;'
]
