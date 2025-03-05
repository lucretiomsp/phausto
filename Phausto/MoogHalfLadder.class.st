"
Virtual analog model of the 2nd-order Moog Half Ladder (simplified version of (ve.)moogLadder). Several 1st-order filters are cascaded in series. Feedback is then used, in part, to control the cut-off frequency and the resonance.

This filter was implemented in Faust by Eric Tarr during the 2019 Embedded DSP With Faust Workshop.
Parameters:
normFreq: normalized frequency (0-1)
Q: quality factor between .707 (0 feedback coefficient) to 25 (feedback = 4, which is the self-oscillating threshold).
"
Class {
	#name : 'MoogHalfLadder',
	#superclass : 'MKOFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
MoogHalfLadder >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
MoogHalfLadder >> initialize [

	super initialize.
	self processExpression: 'process = ve.moogHalfLadder;'
]
