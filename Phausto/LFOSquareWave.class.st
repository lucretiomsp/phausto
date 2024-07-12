"
Zero-mean unit-amplitude LF square wave.
"
Class {
	#name : 'LFOSquareWave',
	#superclass : 'LowFrequencyOscillators',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
LFOSquareWave >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'initialization' }
LFOSquareWave >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewave;'
]
