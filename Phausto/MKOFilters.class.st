"
Collection of Moog, Krg Oberheim style filters where:

normFreq: normalized frequency (0-1)
Q: q
"
Class {
	#name : 'MKOFilters',
	#superclass : 'PhFilter',
	#instVars : [
		'normFreq',
		'q'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
MKOFilters >> normFreq [

	^ normFreq ifNil: [
		  normFreq := PhHSlider new
			        label: self label , 'NormFreq'
			        init: 1
			        min: 0
			        max: 1
			        step: 0.001 ]
]

{ #category : 'accessing' }
MKOFilters >> q [

	^ q ifNil: [
		  q := PhHSlider new
			       label: self label , 'Q'
			       init: 1
			       min: 1
			       max: 25
			       step: 0.707 ]
]
