"
I am the abstract Strategy that writes the JUCE editor files of an exported plugin.

`DSP >> export2JuceWithName:type:editor:` generates the processor, `PhaustoParams.h`, `CMakeLists.txt` and the `.jucer`, then hands me the Source folder through `exportInto:pluginType:`. Those files are identical whatever editor is chosen; only mine differ.

`exportInto:pluginType:` is a Template Method. It writes `PluginEditor.h` and `PluginEditor.cpp`, names that are a contract with `CMakeLists.txt` and the `.jucer`. Subclasses provide:
- `headerFor:` and `implementationFor:`: the C++ content for a `PhPluginType`
- `write:to:` (optional): the write policy; the default overwrites on every export

The editor class is named `<typeName>AudioProcessorEditor` and takes the processor as its only constructor argument, because the generated `createEditor()` calls `new <typeName>AudioProcessorEditor (*this)`. Every subclass must keep that signature.

Subclasses:
- **PhGenericEditorExport**: table-driven editor, the default
- **PhSkeletonEditorExport**: empty editor for hand-written C++ UIs
- **JuSceneEditorExport** (JuBloc package): Bloc-designed editor, not implemented yet
"
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
