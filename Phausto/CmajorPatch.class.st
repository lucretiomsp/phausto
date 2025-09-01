"
Super class to create Cmajor patches
"
Class {
	#name : 'CmajorPatch',
	#superclass : 'Object',
	#instVars : [
		'name',
		'dsp'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'api - exporting' }
CmajorPatch >> dsp [ 

^ dsp
]

{ #category : 'accessing' }
CmajorPatch >> dsp: aDsp [

	dsp := aDsp 
]

{ #category : 'api - exporting' }
CmajorPatch >> export [ 
self subclassResponsibility 
]

{ #category : 'accessing' }
CmajorPatch >> name: aString [

name := aString
]
