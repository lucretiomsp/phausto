"
WahWah pedal demo
"
Class {
	#name : 'Wah4_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Wah4_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Wah4_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
