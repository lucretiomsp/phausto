"
I am the identity of one exported plugin: the names and codes a host uses to tell plugins apart.

I am a _Value Object_. I derive every value from the product name once, so the CMake writer and the .jucer writer always agree.

## Responsibilities:
- targetName: the CMake target and binary name, letters and digits only.
- pluginCode: four characters with exactly one uppercase letter (AU requirement). JUCE builds the VST3 class ID from manufacturerCode + pluginCode, so two plugins sharing that pair look like one plugin to a DAW.
- bundleIdentifier: com.<company>.<targetName in lowercase>.
- companyName and manufacturerCode: fixed for Phausto.

Collaborators: DSP >> createCMakeFileNamed:for:, DSP >> cmakeJuceAddPluginFor:type:, DSP >> createJucerFileNamed:for:.

Example:
```language=Pharo
	(PhPluginIdentity productName: 'Squid Verb') targetName.        ""'SquidVerb'""
	(PhPluginIdentity productName: 'Squid Verb') pluginCode.        ""'Squi'""
	(PhPluginIdentity productName: 'Squid Verb') bundleIdentifier.  ""'com.phausto.squidverb'""
```
### Known limit: two product names that share their first four letters get the same plugin code.
"
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
