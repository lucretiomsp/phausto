"
Superclass for UI elements for a Cmajor GUI created from files 
"
Class {
	#name : 'CmajorUIElement',
	#superclass : 'Object',
	#instVars : [
		'image',
		'size',
		'position',
		'name'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

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
CmajorUIElement >> name: aString [ 

name := aString
]

{ #category : 'accessing' }
CmajorUIElement >> position [ 
^ position
]

{ #category : 'accessing' }
CmajorUIElement >> position: aPoint [

	^ aPoint
]

{ #category : 'accessing' }
CmajorUIElement >> size [  
^ size
]

{ #category : 'accessing' }
CmajorUIElement >> size: aSize [

	size := aSize
]
