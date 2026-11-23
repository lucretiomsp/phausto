"
Simple notch filter based on a biquad (fi.notchw).

**width:** ""notch width"" in Hz (approximate)
**freq:** ""notch frequency"" in Hz
"
Class {
	#name : 'PhNotchW',
	#superclass : 'PhFilter',
	#instVars : [
		'width',
		'freq'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhNotchW >> asBox [

	^ self width asBox , self freq asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhNotchW >> freq [

	^ freq
]

{ #category : 'initialization' }
PhNotchW >> initialize [

	super initialize.
	processExpression := 'process = fi.notchw;'.
	width := PhHSlider new label: self label , 'Width' values: #( 100 1 2000 1 ).
	freq := PhHSlider new label: self label , 'Freq' values: #( 1000 20 18000 1 )
]

{ #category : 'accessing' }
PhNotchW >> width [

	^ width
]

{ #category : 'accessing' }
PhNotchW >> width: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
