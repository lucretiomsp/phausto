"
Superclass for UI elements for a Cmajor GUI created from files 
"
Class {
	#name : 'CmajorUIElement',
	#superclass : 'Object',
	#instVars : [
		'image',
		'name',
		'blElm',
		'position',
		'size'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorUIElement >> asJsObjectString [

	| result imagePath width height |
	imagePath := String new writeStream.
	imagePath
		nextPutAll: ' image: "./';
		nextPutAll: self image;
		nextPutAll: '", '.
	width := String new writeStream.
	width
		nextPutAll: 'width: ';
		nextPutAll: self size x asString;
		nextPutAll: ' , '.
	height := String new writeStream.
	height
		nextPutAll: 'height: ';
		nextPutAll: self size y asString.
	result := String new writeStream.
	result
	   nextPutAll: '{';
		nextPutAll: imagePath contents;
		nextPutAll: width contents;
		nextPutAll: height contents;
		nextPutAll: ' }; '.
	^ result contents
]

{ #category : 'accessing' }
CmajorUIElement >> image [ 

^ image
]

{ #category : 'accessing' }
CmajorUIElement >> image: aString [

image := aString 
]

{ #category : 'initialization' }
CmajorUIElement >> initialize [

	super initialize.

	position := 0 @ 0.
	size := 100 @ 100.
	image := 'nothing.svg'
]

{ #category : 'accessing' }
CmajorUIElement >> name [ 
^ name
]

{ #category : 'accessing' }
CmajorUIElement >> name: aString [ 

name := aString
]

{ #category : 'initialization' }
CmajorUIElement >> position [ 

^ position 
]

{ #category : 'initialization' }
CmajorUIElement >> position: aPoint [ 

position := aPoint 
]

{ #category : 'initialization' }
CmajorUIElement >> size [

^ size
]

{ #category : 'initialization' }
CmajorUIElement >> size: aPoint [

size := aPoint
]
