"
GreyHole Reverb demo
"
Class {
	#name : 'GreyHole_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
GreyHole_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox  , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
