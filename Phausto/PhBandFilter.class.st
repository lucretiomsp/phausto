"
Bandpass and bandstop filters from the Faust filters library, defined by a lower and an upper band edge.

**fl:** lower band-edge frequency (Hz)
**fu:** upper band-edge frequency (Hz)

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhBandFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'fl',
		'fu'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhBandFilter >> asBox [

	^ self fl asBox , self fu asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhBandFilter >> fl [

	^ fl
]

{ #category : 'accessing' }
PhBandFilter >> fl: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBandFilter >> fu [

	^ fu
]

{ #category : 'accessing' }
PhBandFilter >> fu: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhBandFilter >> initialize [

	super initialize.
	fl := PhHSlider new label: self label , 'LowFreq' values: #( 300 20 10000 1 ).
	fu := PhHSlider new label: self label , 'HighFreq' values: #( 3000 20 18000 1 )
]
