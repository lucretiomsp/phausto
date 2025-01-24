"
Light version of Zita Rev1
"
Class {
	#name : 'Zita_Light',
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
Zita_Light >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Zita_Light >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Zita_Light >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
