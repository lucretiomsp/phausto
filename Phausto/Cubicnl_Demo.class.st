"
Cubi Distortion demo
"
Class {
	#name : 'Cubicnl_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Cubicnl_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'as yet unclassified' }
Cubicnl_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
