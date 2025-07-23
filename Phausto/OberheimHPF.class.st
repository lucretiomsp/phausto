"
High-Pass Oberheim filter (see description above). Specialize the generic implementation: keep the third HPF output, the compiler will only generate the needed code.
Parameters:
normFreq: normalized frequency (0-1)
Q: quality factor between .707 (0 feedback coefficient) to 25 (feedback = 4, which is the self-oscillating threshold).
"
Class {
	#name : 'OberheimHPF',
	#superclass : 'MKOFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
OberheimHPF >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq asBox, self q asBox, self input asBox connectTo:
		            intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
OberheimHPF >> initialize [

	super initialize.
	self processExpression: 'process = ve.oberheimHPF;'
]
