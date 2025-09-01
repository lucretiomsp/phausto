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
		'size',
		'isResizable'
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
CmajorView >> background: aDictionary [

	background := aDictionary
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
CmajorView >> folder: aString [

	folder := aString
]

{ #category : 'initialization' }
CmajorView >> initialize [

	super initialize.
	knobs := OrderedCollection new.
	isResizable := true.
	size := 400 @ 400
]

{ #category : 'accessing' }
CmajorView >> isResizable [

^ isResizable 
]

{ #category : 'accessing' }
CmajorView >> isResizable: aBoolean [

isResizable := aBoolean 
]

{ #category : 'accessing' }
CmajorView >> knobs [

	^ knobs
]

{ #category : 'accessing' }
CmajorView >> knobs: anObject [

	knobs := anObject
]

{ #category : 'accessing' }
CmajorView >> patchView [

	^ patchView
]

{ #category : 'properties' }
CmajorView >> patchViewProperty [

	^ 'view' -> {
		  ('src' -> 'ui/index.js').
		  ('width' -> self size x).
		  ('height' -> self size y).
		  ('resizable' -> self isResizable ) } asDictionary
]

{ #category : 'accessing' }
CmajorView >> size [ 
^ size
]

{ #category : 'accessing' }
CmajorView >> size: aPoint [
"width@height"
	size := aPoint
]

{ #category : 'writing' }
CmajorView >> uiConfigFileLocator [

| location file |
location := (FileLocator documents / self folder / 'ui' / 'assets')
		            ensureCreateDirectory.
	file := (location / 'uiConfig.js') ensureCreateFile .
	^ file
]

{ #category : 'writing' }
CmajorView >> writeBackgroundVariableToConfig [

	self uiConfigFileLocator writeStream
		nextPutAll: 'export const  bgConfig = { ';
		nextPutAll: self background asJsObjectString;
		close
]

{ #category : 'writing' }
CmajorView >> writeKnobsVariableToConfig [

	| knobsInsideArray |
	knobsInsideArray := String new writeStream.
	self knobs do: [ :i |
			knobsInsideArray
				nextPutAll: i asJsObjectString;
				nextPutAll: ' , ';
				cr ].

	self uiConfigFileLocator writeStream
		nextPutAll: 'export const knobConfigs = [ ';
		cr;
		nextPutAll: knobsInsideArray contents allButLast;
		nextPutAll: ' ]XXXXXXXXXXX; ';
		close 
]
