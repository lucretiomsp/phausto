"
LowFrequency triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTri,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LFOTri >> initialize [

	super initialize.
	processExpression :=  'process = os.lf_triangle;'
]
