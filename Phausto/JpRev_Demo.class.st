"
Jp REverb demo
"
Class {
	#name : 'JpRev_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
JpRev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
JpRev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
JpRev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
