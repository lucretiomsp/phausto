Class {
	#name : 'PhEditorExportIntegrationTest',
	#superclass : 'ParametrizedTestCase',
	#instVars : [
		'exportCase',
		'dsp'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'private' }
PhEditorExportIntegrationTest class >> isAbstract [

	^ self == PhEditorExportIntegrationTest
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> effectCode [
	"A stereo effect with one control. g is defined once, so both channels share one widget."

	^ 'import("stdfaust.lib");
process = _, _ : *(g), *(g)
with { g = hslider("gain", 0.5, 0, 1, 0.01); };'
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> exportCase: anAssociation [

	exportCase := anAssociation
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> exportWithSkeleton [

	dsp
		export2JuceWithName: self pluginName
		type: self pluginType
		editor: PhSkeletonEditorExport new
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> faustCode [

	^ self subclassResponsibility
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> pluginName [

	^ 'PhEditorExportTestPlugin'
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> pluginType [

	^ self subclassResponsibility
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> setUp [

	super setUp.
	dsp := DSP create: self faustCode.
	dsp generatedCode: self faustCode
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> sourceFile: aString [
	"Spelled out, not taken from DSP >> sourceFolderFor:, so a wrong folder in the exporter fails here."

	^ FileLocator documents / 'faust2Juce' / self pluginName / 'Source' / aString
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> synthCode [
	"freq, gate and gain are MIDI-driven and excluded from APVTS. release stays,
	 so the parameter table is not empty (the zero-parameter case is not fixed yet)."

	^ 'import("stdfaust.lib");
freq = hslider("freq", 440, 20, 4086, 1);
gate = button("gate");
gain = hslider("gain", 0.5, 0, 1, 0.01);
release = hslider("release", 0.1, 0.001, 2, 0.001);
process = os.square(freq) * en.ar(0.01, release, gate) * gain <: _, _;'
]

{ #category : 'helpers' }
PhEditorExportIntegrationTest >> tearDown [

	(FileLocator documents / 'faust2Juce' / self pluginName) ensureDeleteAll.
	super tearDown
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testDefaultExportWritesGenericEditor [

	dsp export2JuceWithName: self pluginName type: self pluginType.
	self assert: ((self sourceFile: 'PluginEditor.cpp') contents
			 includesSubstring: 'PhaustoParams::table')
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testExportRejectsMoreChannelsThanTheBuses [
	"Four channels fit no plugin type, so the export fails before writing anything."

	| quad |
	quad := DSP create: 'process = _, _, _, _;'.
	quad generatedCode: 'process = _, _, _, _;'.
	self
		should: [ quad export2JuceWithName: self pluginName type: self pluginType ]
		raise: Error
		withExceptionDo: [ :error | self assert: (error messageText includesSubstring: 'inputs') ].
	self deny: (FileLocator documents / 'faust2Juce' / self pluginName) exists
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testExportRejectsSoundfiles [
	"MapUI never loads soundfiles, so compute would read an unset Soundfile pointer."

	| code sampler |
	code := 'process = 0, 0 : soundfile("sound", 1) : !, !, _;'.
	sampler := DSP create: code.
	sampler generatedCode: code.
	self
		should: [ sampler export2JuceWithName: self pluginName type: self pluginType ]
		raise: Error
		withExceptionDo: [ :error | self assert: (error messageText includesSubstring: 'soundfile') ]
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testExportWritesBuildScript [

	| script |
	dsp export2JuceWithName: self pluginName type: self pluginType.
	script := FileLocator documents / 'faust2Juce' / self pluginName / 'build.cmake'.
	self assert: script exists.
	self deny: (script contents includes: Character cr)
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testExportWritesTheChannelAdapter [

	self exportWithSkeleton.
	self
		assert: (self sourceFile: 'PhaustoChannelAdapter.h') contents
		equals: PhChannelAdapter new contents withUnixLineEndings
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testFaustHeaderIsTheOneTheProcessorIncludes [
	"The processor includes Faust<Type>.h; LibFaust, across the FFI, must write that exact file."

	| include |
	self exportWithSkeleton.
	include := '#include "Faust' , self pluginType typeName , '.h"'.
	self assert: ((self sourceFile: 'PluginProcessor.h') contents includesSubstring: include).
	self assert: (self sourceFile: 'Faust' , self pluginType typeName , '.h') exists
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testParameters [
	"Each case pairs a plugin type with a Faust program that suits it."

	^ ParametrizedTestMatrix new
		  forSelector: #exportCase
		  addOptions: {
				  (PhEffectPluginType new -> self effectCode).
				  (PhMonoSynthPluginType new -> self synthCode) };
		  yourself
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testReexportKeepsHandWrittenEditorAndRegeneratesTheRest [
	"The point of the skeleton: a Faust change re-exports the processor sand PhaustoParams.h without touching the user's editor."

	| editor processor |
	self exportWithSkeleton.
	editor := self sourceFile: 'PluginEditor.cpp'.
	processor := self sourceFile: 'PluginProcessor.cpp'.
	editor writePosixText: '// mine'.
	processor writePosixText: '// stale'.
	self exportWithSkeleton.
	self assert: editor contents equals: '// mine'.
	self deny: processor contents equals: '// stale'
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testSkeletonExportWritesSkeletonEditor [

	self exportWithSkeleton.
	self assert: ((self sourceFile: 'PluginEditor.h') contents
			 includesSubstring: 'Created once by Phausto')
]

{ #category : 'tests' }
PhEditorExportIntegrationTest >> testWrittenFilesMatchTheirTypedQueries [
	"What lands on disk is exactly what the typed query answers, so the plugin
	 type reached every writer. Files are LF, query strings carry CR."

	self exportWithSkeleton.
	{
		('PhaustoParams.h' -> (dsp asPhaustoParamsHeaderFrom: dsp getJSON for: self pluginType)).
		('PluginProcessor.h' -> (dsp asPluginProcessorHeaderAPVTSFor: self pluginType)).
		('PluginProcessor.cpp' -> (dsp asPluginProcessorCppAPVTSFor: self pluginType)) }
		do: [ :each |
			self
				assert: (self sourceFile: each key) contents
				equals: each value withUnixLineEndings ]
]
