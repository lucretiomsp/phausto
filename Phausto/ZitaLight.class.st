"
Light version of Zita Rev1
"
Class {
	#name : 'ZitaLight',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
ZitaLight >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
