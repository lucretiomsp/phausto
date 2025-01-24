"
A spectral tilt application. A spectral tilt refers to the overall slope or balance of frequencies in a sound's spectrum, where higher frequencies may be emphasized or attenuated relative to lower ones, creating a perceived ""brighter"" or ""darker"" sound.

Parameter
N: filter order (integer)

"
Class {
	#name : 'Spectral_Tilt_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input',
		'n'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Spectral_Tilt_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self n asBox ,self input asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
Spectral_Tilt_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Spectral_Tilt_Demo >> n [

	^ n ifNil: [ n  := 8 asBox ]
]
