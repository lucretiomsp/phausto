"
Helper class to set a background for a Cmajor GUI
"
Class {
	#name : 'CmajorBackground',
	#superclass : 'CmajorUIElement',
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
