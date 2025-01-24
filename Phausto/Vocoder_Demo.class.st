"
Use example of the vocoder function where an impulse train is used as excitation.
"
Class {
	#name : 'Vocoder_Demo',
	#superclass : 'Demos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Vocoder_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Vocoder_Demo >> input [


	^ input ifNil: [ input := 0 asBox ]
]
