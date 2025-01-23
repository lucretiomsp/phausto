"
Jp REverb demo
"
Class {
	#name : 'JpRev_Demo',
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
JpRev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
JpRev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
JpRev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
