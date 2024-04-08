"
LowFrequency triangle wave from the Faust Standard Library
"
Class {
	#name : #LFOTri,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #converting }
LFOTri >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := freq asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
LFOTri >> initialize [

	super initialize.
	processExpression :=  'process = os.lf_triangle;'
]
