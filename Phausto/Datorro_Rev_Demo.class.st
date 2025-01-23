"
Datorro Reverb Demo.

see:
https://ccrma.stanford.edu/~dattorro/EffectDesignPart1.pdf
"
Class {
	#name : 'Datorro_Rev_Demo',
	#superclass : 'Demos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
Datorro_Rev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Datorro_Rev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
Datorro_Rev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
