Class {
	#name : 'PhPluginIdentity',
	#superclass : 'Object',
	#instVars : [
		'productName',
		'companyName',
		'manufacturerCode'
	],
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'as yet unclassified' }
PhPluginIdentity class >> productName: aString [

	^ self new initializeProductName: aString
]

{ #category : 'as yet unclassified' }
PhPluginIdentity >> bundleIdentifier [

	^ 'com.' , companyName asLowercase , '.' , self targetName asLowercase
]

{ #category : 'accessing' }
PhPluginIdentity >> companyName [ 
^ companyName
]

{ #category : 'initialization' }
PhPluginIdentity >> initializeProductName: aString [

	productName := aString.
	companyName := 'Phausto'.
	manufacturerCode := 'Phau'
]

{ #category : 'accessing' }
PhPluginIdentity >> manufacturerCode [ 
^ manufacturerCode 
]

{ #category : 'accessing' }
PhPluginIdentity >> pluginCode [
	"Four characters, exactly one uppercase letter (AU requirement)"

	| letters |
	letters := (productName select: [ :each | each isLetter ]) asLowercase.
	^ (letters , 'xxxx' first: 4) capitalized
]

{ #category : 'accessing' }
PhPluginIdentity >> productName [

^ productName 
]

{ #category : 'accessing' }
PhPluginIdentity >> targetName [
	"CMake target and binary name: letters and digits only"

	^ productName select: [ :each | each isAlphaNumeric ]
]
