"
Helper class to set a background for a Cmajor GUI
"
Class {
	#name : 'CmajorBackground',
	#superclass : 'Object',
	#instVars : [
		'image',
		'size'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorBackground >> asDictionary [ 


| dict |
dict := { 'image' -> self image surroundedByQuotes . 'width' -> self size x . 'height' -> self size y } asDictionary .

^ dict
]

{ #category : 'accessing' }
CmajorBackground >> image [ 

^ image
]

{ #category : 'accessing' }
CmajorBackground >> image: aString [

image := aString 
]

{ #category : 'accessing' }
CmajorBackground >> size [  
^ size
]

{ #category : 'accessing' }
CmajorBackground >> size: aSize [

	size := aSize
]
