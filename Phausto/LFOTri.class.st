"
LowFrequency triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTri,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
LFOTri >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : #initialization }
LFOTri >> initialize [

	super initialize.
	processExpression :=  'process = os.lf_triangle;'
]
