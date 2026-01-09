Class {
	#name : 'CmajorViewTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CmajorViewTest >> testAddViewToPatch [

	| patchWithoutView patchWithView generatedDic expectedDic |
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
{"source":	[ "UITest.cmajor" ],
"description":	"A CanoTest generated in Pharo using Phausto",
"version":	"1.0",
"isInstrument":	false,
"manufacturer":	"Pharo Association",
"view":
    {
        "src": "ui/index.js",
        "width": 400,
        "height": 400,
        "resizable": true
    } ,
"ID":	"pharo.UITest",
"CmajorVersion":	1,
"name":	"UITest"
}'.
	

	self assert: generatedDic equals: expectedDic
]

{ #category : 'tests' }
CmajorViewTest >> testCmajorPatchFolder [

	| patch |
	patch := CmajorPatch new name: 'testpatch'.
	self
		assert: patch folder
		equals: FileLocator documents / 'cmajorPatches' / 'testpatch'
]

{ #category : 'tests' }
CmajorViewTest >> testPatchViewProperty [

	| view result propertyDictionary |
	view := CmajorView new size: 400 @ 300.
	propertyDictionary := {
		                      ('src' -> 'ui/index.js').
		                      ('width' -> view size x).
		                      ('height' -> view size y).
		                      ('resizable' -> view isResizable) }
		                      asDictionary.
	result := 'view' -> propertyDictionary.

	self assert: view patchViewProperty equals: result
]
