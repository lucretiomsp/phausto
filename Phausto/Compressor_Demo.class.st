"
Audio Compressor demo.
A COMPRESSOR is an audio signal processing operation that reduces the volume of loud sounds or amplifies quiet sounds, 
"
Class {
	#name : 'Compressor_Demo',
	#superclass : 'PhDemosStereo',
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
