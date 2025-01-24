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

{ #category : 'as yet unclassified' }
Vital_Rev_Demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'as yet unclassified' }
Vital_Rev_Demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
