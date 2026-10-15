Class {
	#name : 'PhJuceExportTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp',
		'exported'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhJuceExportTest >> contentsOf: aFolder named: aBasename [

	^ (aFolder / 'Source' / aBasename) contents
]

{ #category : 'helpers' }
PhJuceExportTest >> exportType: aPluginType [
	"Export into a throwaway folder and answer it. Registered for deletion."

	| name folder |
	name := self nameFor: aPluginType.
	folder := FileLocator documents / 'faust2Juce' / name.
	folder exists ifTrue: [ folder ensureDeleteAll ].
	exported add: folder.
	dsp export2JuceWithName: name type: aPluginType.
	^ folder
]

{ #category : 'general' }
PhJuceExportTest >> nameFor: aPluginType [

	^ 'PhTest' , aPluginType typeName
]

{ #category : 'running' }
PhJuceExportTest >> setUp [

	super setUp.
	dsp := (SquareOsc new => Korg35LPF new => ZitaRevStereo new) stereo asDsp.
	dsp init.
	exported := OrderedCollection new
]

{ #category : 'running' }
PhJuceExportTest >> tearDown [

	exported do: [ :each | each ensureDeleteAll ].
	dsp ifNotNil: [ dsp destroy ].
	super tearDown
]

{ #category : 'tests' }
PhJuceExportTest >> testBargraphsAreNotParameters [

	self assert: (dsp apvtsParameterControls
		noneSatisfy: [ :each | (each at: #type) endsWith: 'bargraph' ])
]

{ #category : 'helpers' }
PhJuceExportTest >> testCMakeAndJucerAgreeOnSynthFlag [

	{ PhEffectPluginType new. PhPolySynthPluginType new } do: [ :type |
		| folder cmake jucer |
		folder := self exportType: type.
		cmake := (folder / 'CMakeLists.txt') contents.
		jucer := (folder / ((self nameFor: type) , '.jucer')) contents.
		self assert: (cmake includesSubstring: 'IS_SYNTH TRUE') equals: type isSynth.
		self assert: (jucer includesSubstring: 'pluginIsSynth="1"') equals: type isSynth ]
]

{ #category : 'tests' }
PhJuceExportTest >> testDescriptorIdsAreUniqueAndSorted [
	"Ids embed a per-image instance counter, so assert shape, never literals."

	| ids |
	ids := dsp apvtsParameterControls collect: [ :each | each at: #shortname ].
	self assert: ids asSet size equals: ids size.
	self assert: ids asArray equals: ids asSortedCollection asArray
]

{ #category : 'helpers' }
PhJuceExportTest >> testEditorIteratesTheDescriptorTable [

	self assert: ((self contentsOf: (self exportType: PhEffectPluginType new) named: 'PluginEditor.cpp')
		includesSubstring: 'PhaustoParams::table')
]

{ #category : 'helpers' }
PhJuceExportTest >> testEffectExportWritesEverySourceFile [

	| written |
	written := ((self exportType: PhEffectPluginType new) / 'Source') children
		collect: [ :each | each basename ].
	#( 'PhaustoParams.h' 'PluginProcessor.h' 'PluginProcessor.cpp'
	   'PluginEditor.h' 'PluginEditor.cpp' 'FaustEffect.h' 'PhaustoChannelAdapter.h' )
		do: [ :each |
			self assert: (written includes: each) description: each , ' was not written' ]
]

{ #category : 'tests' }
PhJuceExportTest >> testEveryWriterDelegatesToItsQuery [
    "Each create... must write what its as... query answers. A writer with its own inline template would bypass the tests."
    | stale |
    stale := { #createHeaderAPVTSFilesNamed:for: -> #asPluginProcessorHeaderAPVTSFor:.
        #createCppAPVTSFilesNamed:for: -> #asPluginProcessorCppAPVTSFor:.
        #createHeaderEditorAPVTSFilesNamed:for: -> #asPluginEditorHeaderAPVTSFor:.
        #createCppEditorAPVTSFilesNamed:for: -> #asPluginEditorCppAPVTSFor:.
        #createCMakeFileNamed:for: -> #asCMakeListsFor:type:.
        #createJucerFileNamed:for: -> #asJucerFor:type:.
        #createBuildScriptNamed: -> #contents.
        #createChannelAdapterNamed: -> #contents }
            reject: [ :each | (DSP >> each key) messages includes: each value ].
    self assert: stale isEmpty description: 'Writers with inline templates: ' , stale printString
]

{ #category : 'helpers' }
PhJuceExportTest >> testJucerListsParamsHeader [

	| type |
	type := PhEffectPluginType new.
	self assert: (((self exportType: type) / ((self nameFor: type) , '.jucer')) contents
		includesSubstring: 'Source/PhaustoParams.h')
]

{ #category : 'helpers' }
PhJuceExportTest >> testJucerListsTheFaustHeaderThatWasWritten [

	{ PhEffectPluginType new. PhPolySynthPluginType new } do: [ :type |
		| folder |
		folder := self exportType: type.
		self assert: ((folder / ((self nameFor: type) , '.jucer')) contents
			includesSubstring: 'Source/Faust' , type typeName , '.h') ]
]

{ #category : 'helpers' }
PhJuceExportTest >> testOneDescriptorRowPerAutomatableControl [

	| header rows |
	header := self contentsOf: (self exportType: PhEffectPluginType new) named: 'PhaustoParams.h'.
	rows := (header lines select: [ :each | each includesSubstring: '{ "' ]) size.
	self assert: rows equals: dsp apvtsParameterControls size
]

{ #category : 'tests' }
PhJuceExportTest >> testProcessorCppSynthHandlesMidiBeforeCompute [

	| cpp midi compute |
	cpp := dsp asPluginProcessorCppAPVTSFor: self synth.
	midi := cpp indexOfSubCollection: 'handleMidi (midiMessages);'.
	compute := cpp indexOfSubCollection: 'channels.process (*fDSP, buffer);'.
	self assert: midi > 0.
	self assert: midi < compute
]

{ #category : 'tests' }
PhJuceExportTest >> testProcessorIncludesTheFaustHeaderThatWasWritten [
	"The #include is built from the plugin type. If the writer hardcoded 'Effect',
	 the two would disagree and nothing would compile."

	{ PhEffectPluginType new. PhPolySynthPluginType new } do: [ :type |
		| folder expected |
		folder := self exportType: type.
		expected := 'Faust' , type typeName , '.h'.
		self
			assert: (folder / 'Source' / expected) exists
			description: expected , ' was not written for ' , type typeName.
		self
			assert: ((self contentsOf: folder named: 'PluginProcessor.cpp')
				includesSubstring: '#include "' , expected , '"')
			description: 'processor does not include ' , expected ]
]

{ #category : 'helpers' }
PhJuceExportTest >> testProcessorIteratesTheDescriptorTable [

	self assert: ((self contentsOf: (self exportType: PhEffectPluginType new) named: 'PluginProcessor.cpp')
		includesSubstring: 'PhaustoParams::table')
]

{ #category : 'helpers' }
PhJuceExportTest >> testProjectFilesWrittenBesideSource [

	| type folder |
	type := PhEffectPluginType new.
	folder := self exportType: type.
	self assert: (folder / 'CMakeLists.txt') exists.
	self assert: (folder / ((self nameFor: type) , '.jucer')) exists
]
