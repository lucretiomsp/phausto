"
Light version of Zita Rev1
"
Class {
	#name : 'Zita_Light',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Zita_Light >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]
