"
Superclass for stereo demos
"
Class {
	#name : 'PhDemosStereo',
	#superclass : 'PhDemos',
	#instVars : [
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'initialization' }
PhDemosStereo >> initialize [

	super initialize.
	inputL := 0.
	inputR := 0 
]

{ #category : 'accessing' }
PhDemosStereo >> inputL [

^ inputL
]

{ #category : 'accessing' }
PhDemosStereo >> inputR [

	^ inputR
]
