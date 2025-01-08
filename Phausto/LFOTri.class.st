"
LowFrequency triangle wave from the Faust Standard Library
"
Class {
	#name : 'LFOTri',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOTri >> initialize [

	super initialize.
	processExpression :=  'process = os.lf_triangle;'
]
