"
Collection of _Moog_, _Korg_ , _Oberheim_ style filters where:

## Parameters
- **normFreq**: normalized frequency (0-1)
- **q**: q factor(resonance of the filter.

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'MKOFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'normFreq',
		'q'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'as yet unclassified' }
MKOFilter >> initialize [

	super initialize.
	normFreq := PhHSlider new
		            label: self label , 'NormFreq'
		            init: 1
		            min: 0
		            max: 1
		            step: 0.001.
		
	q := PhHSlider new
				       label: self label , 'Q'
				       init: 1
				       min: 1
				       max: 25
				       step: 0.707 
]

{ #category : 'accessing' }
MKOFilter >> normFreq [

	^ normFreq 
]

{ #category : 'accessing' }
MKOFilter >> q [

	^ q 
]
