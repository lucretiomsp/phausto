Class {
	#name : 'CmajorViewTest',
	#superclass : 'TestCase',
	#instVars : [
		'isResizable'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CmajorViewTest >> testPatchViewProperty [

	| view result propertyDictionary |
	view := CmajorView new size: 400 @ 300.
	propertyDictionary := {
		                      ('src' -> 'ui/index.js ').
		                      ('width' -> view size x).
		                      ('height' -> view size y).
		                      ('resizable' -> view isResizable ) } asDictionary.
	result := 'view' -> propertyDictionary.
	self assert: view patchViewProperty  equals: result 
]
