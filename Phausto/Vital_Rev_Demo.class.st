"
VitalRev demo
"
Class {
	#name : 'Vital_Rev_Demo',
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
Vital_Rev_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL , self inputR asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'accessing' }
Vital_Rev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
Vital_Rev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
