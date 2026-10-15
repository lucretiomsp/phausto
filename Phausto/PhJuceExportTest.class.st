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
	name := 'PhTest' , aPluginType.
	folder := FileLocator documents / 'faust2Juce' / name.
	folder exists ifTrue: [ folder ensureDeleteAll ].
	exported add: folder.
	dsp export2JuceWithName: name type: aPluginType.
	^ folder
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

{ #category : 'running' }
PhJuceExportTest >> testCMakeAndJucerAgreeOnSynthFlag [

	#( 'Effect' 'PolySynth' ) do: [ :type |
		| folder cmake jucer synth |
		folder := self exportType: type.
		synth := type = 'Effect' ifTrue: [ 'FALSE' ] ifFalse: [ 'TRUE' ].
		cmake := (folder / 'CMakeLists.txt') contents.
		jucer := (folder / ('PhTest' , type , '.jucer')) contents.
		self assert: (cmake includesSubstring: 'IS_SYNTH ' , synth).
		self assert: (jucer includesSubstring: 'pluginIsSynth="'
			, (type = 'Effect' ifTrue: [ '0' ] ifFalse: [ '1' ]) , '"') ]
]

{ #category : 'tests' }
PhJuceExportTest >> testDescriptorIdsAreUniqueAndSorted [
	"Ids embed a per-image instance counter, so assert shape, never literals."

	| ids |
	ids := dsp apvtsParameterControls collect: [ :each | each at: #shortname ].
	self assert: ids asSet size equals: ids size.
	self assert: ids asArray equals: ids asSortedCollection asArray
]

{ #category : 'tests' }
PhJuceExportTest >> testEditorIteratesTheDescriptorTable [

	self assert: ((self contentsOf: (self exportType: 'Effect') named: 'PluginEditor.cpp')
		includesSubstring: 'PhaustoParams::table')
]

{ #category : 'running' }
PhJuceExportTest >> testEffectExportWritesEverySourceFile [

	| written |
	written := ((self exportType: 'Effect') / 'Source') children
		collect: [ :each | each basename ].
	#( 'PhaustoParams.h' 'PluginProcessor.h' 'PluginProcessor.cpp'
	   'PluginEditor.h' 'PluginEditor.cpp' 'FaustEffect.h' )
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

{ #category : 'running' }
PhJuceExportTest >> testJucerListsParamsHeader [

	self assert: (((self exportType: 'Effect') / 'PhTestEffect.jucer') contents
		includesSubstring: 'Source/PhaustoParams.h')
]

{ #category : 'running' }
PhJuceExportTest >> testJucerListsTheFaustHeaderThatWasWritten [

	#( 'Effect' 'PolySynth' ) do: [ :type |
		| folder |
		folder := self exportType: type.
		self assert: ((folder / ('PhTest' , type , '.jucer')) contents
			includesSubstring: 'Source/Faust' , type , '.h') ]
]

{ #category : 'tests' }
PhJuceExportTest >> testOneDescriptorRowPerAutomatableControl [

	| header rows |
	header := self contentsOf: (self exportType: 'Effect') named: 'PhaustoParams.h'.
	rows := (header lines select: [ :each | each includesSubstring: '{ "' ]) size.
	self assert: rows equals: dsp apvtsParameterControls size
]

{ #category : 'tests' }
PhJuceExportTest >> testProcessorCppSynthHandlesMidiBeforeCompute [
    | cpp midi compute |
    cpp := dsp asPluginProcessorCppAPVTSFor: self synth.
    midi := cpp indexOfSubCollection: 'handleMidi (midiMessages);'.
    compute := cpp indexOfSubCollection: 'channels.process (fDSP, buffer);'.
    self assert: midi > 0.
    self assert: midi < compute
]
