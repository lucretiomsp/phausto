Class {
	#name : 'CmajorViewTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CmajorViewTest >> testAddViewToPatch [

	| patchWithoutView patchWithView |
	patchWithoutView := '{"CmajorVersion":	1,
"ID":	"pharo.UITest",
"version":	"1.0",
"name":	"UITest",
"description":	"A CanoTest generated in Pharo using Phausto",
"manufacturer":	"Pharo Association",
"isInstrument":	false,
"source":	[ "UITest.cmajor" ]
}'.
	patchWithView := '
{"CmajorVersion":	1,
"ID":	"pharo.UITest",
"version":	"1.0",
"name":	"UITest",
"description":	"A CanoTest generated in Pharo using Phausto",
"manufacturer":	"Pharo Association",
"isInstrument":	false,
"source":	[ "UITest.cmajor" ],
"view":
    {
        "src": "ui/index.js",
        "width": 400,
        "height": 400,
        "resizable": false
    }
}'.

	self
		assert: (STONJSON  fromString: (patchWithoutView addViewPropertyFrom: CmajorView new))
		equals: (STONJSON  fromString: patchWithView)
]

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
