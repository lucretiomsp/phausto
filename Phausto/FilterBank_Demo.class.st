"
Filter bank demo
"
Class {
	#name : 'FilterBank_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
FilterBank_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
FilterBank_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
