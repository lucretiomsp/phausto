"
Dynamic level lowpass filter (fi.levelfilter): the lower the level, the darker the sound, as in a struck string or a piano played softly.

**level:** desired level (in dB) at Nyquist, from 0 (dark) to 1 (bright)
**freq:** band-edge frequency (Hz)
"
Class {
	#name : 'PhLevelFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'level',
		'freq'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLevelFilter >> asBox [

	^ self level asBox , self freq asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhLevelFilter >> freq [

	^ freq
]

{ #category : 'initialization' }
PhLevelFilter >> initialize [

	super initialize.
	processExpression := 'process = fi.levelfilter;'.
	level := PhHSlider new label: self label , 'Level' values: #( 0.5 0 1 0.01 ).
	freq := PhHSlider new label: self label , 'Freq' values: #( 1000 20 18000 1 )
]

{ #category : 'accessing' }
PhLevelFilter >> level [

	^ level
]

{ #category : 'accessing' }
PhLevelFilter >> level: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
