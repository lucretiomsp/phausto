"
I am an helper class to create a simple GUI for a Cmajor exported patch
"
Class {
	#name : 'CmajorView',
	#superclass : 'Object',
	#instVars : [
		'folder',
		'background',
		'knobs',
		'buttons',
		'faders',
		'patchView',
		'size'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'adding' }
CmajorView >> addToCmajorPatch [

	self shouldBeImplemented 
]

{ #category : 'accessing' }
CmajorView >> background [

	^ background
]

{ #category : 'accessing' }
CmajorView >> background: anObject [

	background := anObject
]

{ #category : 'accessing' }
CmajorView >> buttons [

	^ buttons
]

{ #category : 'accessing' }
CmajorView >> buttons: anObject [

	buttons := anObject
]

{ #category : 'accessing' }
CmajorView >> faders [

	^ faders
]

{ #category : 'accessing' }
CmajorView >> faders: anObject [

	faders := anObject
]

{ #category : 'accessing' }
CmajorView >> folder [

	^ folder
]

{ #category : 'accessing' }
CmajorView >> folder: anObject [

	folder := anObject
]

{ #category : 'accessing' }
CmajorView >> knobs [

	^ knobs
]

{ #category : 'accessing' }
CmajorView >> knobs: anObject [

	knobs := anObject
]
