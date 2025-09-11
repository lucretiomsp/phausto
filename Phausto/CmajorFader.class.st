"
Helper class to build kobs for the Cmajor GUIs from image files.
Two image fiels are neded, one for the backgrounf and one for the thumb. The fader can be vertical (as default) or horizontal (by setting the _isHorizontal_ variable to **true**)
"
Class {
	#name : 'CmajorFader',
	#superclass : 'CmajorUIElement',
	#instVars : [
		'thumbImage',
		'isHorizontal'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorFader >> asJsObjectString [

	| result left top nameAsString endpoint orientation thumbImagePath |
	nameAsString := String new writeStream.
	nameAsString
		nextPutAll: 'name: ';
		nextPutAll: self name surroundedByQuotes;
		nextPutAll: ', '.
	endpoint := String new writeStream.
	endpoint
		nextPutAll: 'endpointID: ';
		nextPutAll: ('event_' , self name)  surroundedByQuotes;
		nextPutAll: ', '.
	left := String new writeStream.
	left
		nextPutAll: 'left: ';
		nextPutAll: self position x asString;
		nextPutAll: ' , '.
	top := String new writeStream.
	top
		nextPutAll: 'top: ';
		nextPutAll: self position y asString.
		
	orientation := String new writeStream.
	orientation nextPutAll: 'isHorizontal: ';
	nextPutAll: self isHorizontal asString.
	
	thumbImagePath := String new writeStream.
	thumbImagePath
		nextPutAll: ' bgthumb: "./';
		nextPutAll: self thumbImage;
		nextPutAll: '",'.
	

	result := String new writeStream.
	result
		nextPutAll: (super asJsObjectString allButLast: 3);
		nextPutAll: ' , ';
		nextPutAll: nameAsString contents;
		nextPutAll: endpoint contents;
		nextPutAll: left contents;
		nextPutAll: top contents;
		nextPutAll: ' } '.
	^ result contents
]

{ #category : 'accessing' }
CmajorFader >> isHorizontal [ 

^ isHorizontal
]

{ #category : 'accessing' }
CmajorFader >> isHorizontal: aBoolean [ 

isHorizontal := aBoolean.
]

{ #category : 'accessing' }
CmajorFader >> thumbImage [

^ thumbImage
]
