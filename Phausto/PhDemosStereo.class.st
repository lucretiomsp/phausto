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

{ #category : 'converting' }
PhDemosStereo >> asBox [

	^ self inputL asBox , self inputR asBox connectTo: self code asBox
]

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

{ #category : 'connecting' }
PhDemosStereo >> patchedWith: aUnitGenerator [

self inputL: aUnitGenerator ; inputR: aUnitGenerator 
]
