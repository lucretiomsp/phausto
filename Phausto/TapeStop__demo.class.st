"
TapeStop effect demo.
A tape stop effect mimics the sound of a tape recorder or turntable slowing to a stop, creating a dramatic drop in pitch and speed that gradually fades into silence.
"
Class {
	#name : 'TapeStop__demo',
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
TapeStop__demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR  asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'initialization' }
TapeStop__demo >> initialize [

	super initialize.

	processExpression := 'process = dm.tapeStop_demo;'
]

{ #category : 'accessing' }
TapeStop__demo >> inputL [


	^ inputL ifNil: [ inputL := 0 asBox ]
]

{ #category : 'accessing' }
TapeStop__demo >> inputR [


	^ inputR ifNil: [ inputR := 0 asBox ]
]
