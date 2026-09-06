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

{ #category : 'running' }
PhJuceExportTest >> testProcessorIncludesTheFaustHeaderThatWasWritten [
	"The #include is built from aPluginType. If the writer hardcodes 'Effect',
	 the two disagree and nothing compiles."

	#( 'Effect' 'PolySynth' ) do: [ :type |
		| folder expected |
		folder := self exportType: type.
		expected := 'Faust' , type , '.h'.
		self
			assert: (folder / 'Source' / expected) exists
			description: expected , ' was not written for type ' , type.
		self
			assert: ((self contentsOf: folder named: 'PluginProcessor.h')
				includesSubstring: '#include "' , expected , '"')
			description: 'processor does not include ' , expected ]
]

{ #category : 'tests' }
PhJuceExportTest >> testProcessorIteratesTheDescriptorTable [

	self assert: ((self contentsOf: (self exportType: 'Effect') named: 'PluginProcessor.cpp')
		includesSubstring: 'PhaustoParams::table')
]

{ #category : 'running' }
PhJuceExportTest >> testProjectFilesWrittenBesideSource [

	| folder |
	folder := self exportType: 'Effect'.
	self assert: (folder / 'CMakeLists.txt') exists.
	self assert: (folder / 'PhTestEffect.jucer') exists
]
