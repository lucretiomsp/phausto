"
Generic multi-outputs Oberheim filter that produces the BSF, BPF, HPF and LPF outputs (see description above).
Parameters:
normFreq: normalized frequency (0-1)
Q: quality factor between .707 (0 feedback coefficient) to 25 (feedback = 4, which is the self-oscillating threshold).
"
Class {
	#name : 'Oberheim',
	#superclass : 'MKOFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Oberheim >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Oberheim >> initialize [

	super initialize.
	self processExpression: 'process = ve.oberheim;'
]
