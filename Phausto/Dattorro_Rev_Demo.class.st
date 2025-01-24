"
Datorro Reverb Demo.

see:
https://ccrma.stanford.edu/~dattorro/EffectDesignPart1.pdf
"
Class {
	#name : 'Dattorro_Rev_Demo',
	#superclass : 'Demos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Dattorro_Rev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Dattorro_Rev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Dattorro_Rev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
