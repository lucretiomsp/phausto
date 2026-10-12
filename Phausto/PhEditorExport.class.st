Class {
	#name : 'PhEditorExport',
	#superclass : 'Object',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'template method' }
PhEditorExport >> exportInto: aFolder pluginType: aPluginType [
	"The file names are a contract with CMakeLists.txt and the .jucer."

	self write: (self headerFor: aPluginType) to: aFolder / 'PluginEditor.h'.
	self
		write: (self implementationFor: aPluginType)
		to: aFolder / 'PluginEditor.cpp'
]

{ #category : 'template method' }
PhEditorExport >> headerFor: aPluginType [

	^ self subclassResponsibility
]

{ #category : 'template method' }
PhEditorExport >> implementationFor: aPluginType [

	^ self subclassResponsibility
]

{ #category : 'template method' }
PhEditorExport >> write: aString to: aFileReference [
	"Hook. Generated files are overwritten on every export."

	aFileReference writePosixText: aString
]
