"
Produce distortion by reduction of the signal resolution.

##Parameters:

**nbits:** the number of bits of the wanted resolution
"
Class {
	#name : 'PhBitCrusher',
	#superclass : 'PhBasics',
	#instVars : [
		'nbits'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhBitCrusher >> asBox [

	^ self nbits asBox , self input asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhBitCrusher >> initialize [

	super initialize.
	processExpression := 'process = ba.bitcrusher;'.
	nbits := PhHSlider new label: self label values: #( 16 2 16 2 ).
]

{ #category : 'accessing' }
PhBitCrusher >> nbits [ 
^ nbits 
]

{ #category : 'accessing' }
PhBitCrusher >> nbits: aNumberOrABoxOrASymbol [

<paramSetter>

	self paramSetter value: aNumberOrABoxOrASymbol
]
