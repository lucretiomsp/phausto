"
I am the editor choice for DSP >> export2JuceWithName:type:editor: (Strategy). My exportInto:pluginType: writes PluginEditor.h and PluginEditor.cpp (Template Method); my subclasses provide their content.

Create instances through my class-side Constructor Methods (Kent Beck, Smalltalk Best Practice Patterns), so callers name the choice rather than a concrete subclass:
	PhEditorExport generic	""generated editor, one control per parameter; the default""
	PhEditorExport skeleton	""template code only: the user adds components and attachments""

Example:
	dsp export2JuceWithName: 'MyPlugin' type: PhEffectPluginType new editor: PhEditorExport skeleton
"
Class {
	#name : 'PhEditorExport',
	#superclass : 'Object',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'instance creation' }
PhEditorExport class >> generic [
	"Generated editor, one control per parameter. The default."

	^ PhGenericEditorExport new
]

{ #category : 'instance creation' }
PhEditorExport class >> skeleton [
	"Template-only editor: the user adds components and attachments."

	^ PhSkeletonEditorExport new
]

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
