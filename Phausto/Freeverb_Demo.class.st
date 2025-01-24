"
Freeverb demo
"
Class {
	#name : 'Freeverb_Demo',
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
Freeverb_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR  asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Freeverb_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Freeverb_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
