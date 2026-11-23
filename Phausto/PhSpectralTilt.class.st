"
Spectral tilt filter (fi.spectral_tilt), 5 first-order sections: gives a roll-off of alpha x 6 dB per octave over the band f0 ... f0 + bw.

**f0:** lower frequency of the tilted band (Hz)
**bw:** bandwidth of the tilted band (Hz)
**alpha:** slope, -1 (pink-like -6dB/oct) to 1 (+6dB/oct)
"
Class {
	#name : 'PhSpectralTilt',
	#superclass : 'PhFilter',
	#instVars : [
		'f0',
		'bw',
		'alpha'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhSpectralTilt >> alpha [

	^ alpha
]

{ #category : 'accessing' }
PhSpectralTilt >> alpha: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'converting' }
PhSpectralTilt >> asBox [

	^ self f0 asBox , self bw asBox , self alpha asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhSpectralTilt >> bw [

	^ bw
]

{ #category : 'accessing' }
PhSpectralTilt >> bw: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhSpectralTilt >> f0 [

	^ f0
]

{ #category : 'accessing' }
PhSpectralTilt >> f0: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhSpectralTilt >> initialize [

	super initialize.
	processExpression := 'process = fi.spectral_tilt(5);'.
	f0 := PhHSlider new label: self label , 'F0' values: #( 100 20 1000 1 ).
	bw := PhHSlider new label: self label , 'Bandwidth' values: #( 5000 100 18000 1 ).
	alpha := PhHSlider new label: self label , 'Alpha' values: #( -0.5 -1 1 0.01 )
]
