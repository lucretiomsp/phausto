Class {
	#name : 'CmajorViewTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CmajorViewTest >> testPatchViewProperty [

	| view result propertyDictionary|
	view := CmajorView new size: 400 @ 300.
	propertyDictionary := {
		                      ('src' -> 'ui/index.js ').
		                      ('width' -> view size x).
		                      ('height' -> view size y).
		                      ('resizable' -> self isResizable) }
		                      asDictionary.
	result := 'view' -> propertyDictionary.
	self assert: view patchViewProperty equals: 0
]
