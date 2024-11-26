Class {
	#name : 'DiodeLadder',
	#superclass : 'MoogFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
DiodeLadder >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
DiodeLadder >> normFreq [

	^ normFreq ifNil: [
		  normFreq := PhHSlider new
			        label: self label , 'NormFreq'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]

{ #category : 'accessing' }
DiodeLadder >> q [

	^ q ifNil: [
		  q := PhHSlider new
			              label: self label , 'Q'
			              init: 1
			              min: 0
			              max: 1
			              step: 0.001 ]
]
