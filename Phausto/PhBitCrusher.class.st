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

{ #category : 'accessing' }
PhBitCrusher >> initialize [

	super initialize.
	processExpression := 'process = ba.bitcrusher;'.
	nbits := 8.
]

{ #category : 'accessing' }
PhBitCrusher >> nbits [ 
^ nbits 
]
