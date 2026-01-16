"
TapeStop effect demo.
A tape stop effect mimics the sound of a tape recorder or turntable slowing to a stop, creating a dramatic drop in pitch and speed that gradually fades into silence.
"
Class {
	#name : 'TapeStop_Demo',
	#superclass : 'PhDemosStereo',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
TapeStop_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self inputL asBox , self inputR  asBox connectTo: intermediateBox .

	^ finalBox
]

{ #category : 'initialization' }
TapeStop_Demo >> initialize [

	super initialize.

	processExpression := 'process = dm.tapeStop_demo;'
]
