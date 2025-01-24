"
Audio Compressor demo.
A COMPRESSOR is an audio signal processing operation that reduces the volume of loud sounds or amplifies quiet sounds, 
"
Class {
	#name : 'Compressor_Demo',
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
Compressor_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Compressor_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
Compressor_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
