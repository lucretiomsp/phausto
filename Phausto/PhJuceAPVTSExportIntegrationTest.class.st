Class {
	#name : 'PhJuceAPVTSExportIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
PhJuceAPVTSExportIntegrationTest >> setUp [
super setUp.
	dsp := (SquareOsc new => Korg35LPF new => ZitaRevStereo new) stereo asDsp.
	dsp init
]

{ #category : 'running' }
PhJuceAPVTSExportIntegrationTest >> tearDown [ 
dsp ifNotNil: [ dsp destroy ].
	dsp := nil.
	super tearDown
]

{ #category : 'running' }
PhJuceAPVTSExportIntegrationTest >> testExportWritesEverySourceFile [ 

	| folder |
	dsp export2JuceAPVTSWithName: 'ApvtsSmoke' type: 'Effect'.
	folder := FileLocator documents / 'faust2Juce' / 'ApvtsSmoke' / 'Source'.
	#( 'PhaustoParams.h' 'PluginProcessor.h' 'PluginProcessor.cpp'
	   'PluginEditor.h' 'PluginEditor.cpp' 'FaustEffect.h' )
		do: [ :each |
			self
				assert: (folder / each) exists
				description: each , ' was not written' ]
]

{ #category : 'running' }
PhJuceAPVTSExportIntegrationTest >> testMonoSynthExportWritesMatchingFaustHeader [ 
	"Catches the hardcoded type: 'Effect' in createFaustEffectHeaderFileNamed:."

	| folder |
	dsp export2JuceAPVTSWithName: 'ApvtsMono' type: 'MonoSynth'.
	folder := FileLocator documents / 'faust2Juce' / 'ApvtsMono' / 'Source'.
	self assert: (folder / 'FaustMonoSynth.h') exists
]

{ #category : 'running' }
PhJuceAPVTSExportIntegrationTest >> testWrittenHeaderMatchesEmitter [ 
	"What lands on disk must be what the emitter produced."

	| folder written |
	dsp export2JuceAPVTSWithName: 'ApvtsSmoke' type: 'Effect'.
	folder := FileLocator documents / 'faust2Juce' / 'ApvtsSmoke' / 'Source'.
	written := (folder / 'PhaustoParams.h') contents.
	self assert: written equals: dsp asPhaustoParamsHeader
]
