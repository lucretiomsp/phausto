"
Helper class to build kobs for the Cmajor GUIs from image files
"
Class {
	#name : 'CmajorKnob',
	#superclass : 'CmajorUIElement',
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorKnob >> asJsObjectString [

	| result left top nameAsString endpoint |
	nameAsString := String new writeStream.
	nameAsString nextPutAll: 'name: ';nextPutAll: self name surroundedByQuotes; nextPutAll: ', ' .
	endpoint := String new writeStream.
	endpoint nextPutAll: 'endpoint: ';nextPutAll: self name surroundedByQuotes; nextPutAll: ', ' .
	left := String new writeStream.
	left
		nextPutAll: 'left: ';
		nextPutAll: self position x asString;
		nextPutAll: ' , '.
	top := String new writeStream.
	top
		nextPutAll: 'top: ';
		nextPutAll: self position y asString;
		nextPutAll: ' , '.

	result := String new writeStream.
	result nextPutAll: super asJsObjectString allButLast; nextPutAll: nameAsString; nextPutAll: endpoint; nextPutAll: left ; nextPutAll: top; nextPutAll: ' } '.
	^ result contents
]

{ #category : 'accessing' }
CmajorKnob >> name [ 
^ name
]
