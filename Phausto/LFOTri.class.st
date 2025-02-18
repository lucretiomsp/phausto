"
LowFrequency triangle wave from the Faust Standard Library

## Parameters:

- **freq: frequency in Hz
"
Class {
	#name : 'LFOTri',
	#superclass : 'LFO',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
LFOTri >> initialize [

	super initialize.
	processExpression :=  'process = os.lf_triangle;'
]
