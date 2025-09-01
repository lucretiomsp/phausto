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

{ #category : 'converting' }
CmajorBackground >> asJsObjectString [

	| result imagePath width height stream |
	imagePath := String new writeStream.
	imagePath
		nextPutAll: ' image: "./';
		nextPutAll: self image;
		nextPutAll: '", '.
	width := String new writeStream.
	width
		nextPutAll: 'width: ';
		nextPutAll: self size x asString; nextPutAll: ' , '.
	height := String new writeStream.
	height
		nextPutAll: 'height: ';
		nextPutAll: self size y asString.
	result := String new writeStream.
	result
		nextPutAll: 'export const bgConfig = {';
		nextPutAll: imagePath contents;
		nextPutAll: width contents;
		nextPutAll: height contents;
      nextPutAll: ' } ' .
	^ result  contents
]
