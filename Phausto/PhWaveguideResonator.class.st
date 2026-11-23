"
Second order digital waveguide resonators from the Faust filters library. 1 input (excitation), 2 outputs (cosine and sine parts).

**freq:** resonance frequency (Hz)
**r:** pole radius / decay factor, 0 to 1 (1 = sustained oscillation)

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhWaveguideResonator',
	#superclass : 'PhFilter',
	#instVars : [
		'freq',
		'r'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhWaveguideResonator >> asBox [

	^ self freq asBox , self r asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhWaveguideResonator >> freq [

	^ freq
]

{ #category : 'initialization' }
PhWaveguideResonator >> initialize [

	super initialize.
	freq := PhHSlider new label: self label , 'Freq' values: #( 440 20 10000 1 ).
	r := PhHSlider new label: self label , 'R' values: #( 0.99 0 1 0.001 )
]

{ #category : 'accessing' }
PhWaveguideResonator >> r [

	^ r
]

{ #category : 'accessing' }
PhWaveguideResonator >> r: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
