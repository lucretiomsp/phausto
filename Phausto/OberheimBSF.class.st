"
Band-Stop Oberheim filter (see description above). Specialize the generic implementation: keep the first BSF output, the compiler will only generate the needed code.

Parameters:
normFreq: normalized frequency (0-1)
Q: quality factor between .707 (0 feedback coefficient) to 25 (feedback = 4, which is the self-oscillating threshold).
"
Class {
	#name : 'OberheimBSF',
	#superclass : 'MKOFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
OberheimBSF >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
OberheimBSF >> initialize [

	super initialize.
	self processExpression: 'process = ve.oberheimBSF;'
]
