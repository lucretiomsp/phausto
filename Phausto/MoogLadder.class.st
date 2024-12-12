"
Virtual analog model of the 4th-order Moog Ladder, which is arguably the most well-known ladder filter in analog synthesizers. Several 1st-order filters are cascaded in series. Feedback is then used, in part, to control the cut-off frequency and the resonance.

Parameters:
normFreq: normalized frequency (0-1)
Q: quality factor between .707 (0 feedback coefficient) to 25 (feedback = 4, which is the self-oscillating threshold).
"
Class {
	#name : 'MoogLadder',
	#superclass : 'MKOFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
MoogLadder >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
MoogLadder >> initialize [

	super initialize.
	self processExpression: 'process = ve.moogLadder;'
]

{ #category : 'accessing' }
MoogLadder >> normFreq [

	^ normFreq ifNil: [
		  normFreq := PhHSlider new
			        label: self label , 'NormFreq'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]

{ #category : 'accessing' }
MoogLadder >> q [

	^ q ifNil: [
		  q := PhHSlider new
			       label: self label , 'Q'
			       init: 1
			       min: 1
			       max: 25
			       step: 0.707 ]
]