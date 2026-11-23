"
Dynamic level lowpass filter made of 3 cascaded levelfilters (fi.levelfilterN).

**freq:** band-edge frequency (Hz)
**level:** desired level, from 0 (dark) to 1 (bright)
"
Class {
	#name : 'PhLevelFilterN',
	#superclass : 'PhLevelFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLevelFilterN >> asBox [

	^ self freq asBox , self level asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhLevelFilterN >> initialize [

	super initialize.
	processExpression := 'process = fi.levelfilterN(3);'
]
