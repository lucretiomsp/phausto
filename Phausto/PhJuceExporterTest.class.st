Class {
	#name : 'PhJuceExporterTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'accessing' }
PhJuceExporterTest >> descriptorRowsIn: aHeader [
    ^ aHeader lines select: [ :line | line includesSubstring: '"/MyApp/' ]
]

{ #category : 'accessing' }
PhJuceExporterTest >> effect [
    ^ PhEffectPluginType new
]

{ #category : 'running' }
PhJuceExporterTest >> setUp [

	super setUp.
	dsp := DSP new name: 'MyApp'
]

{ #category : 'accessing' }
PhJuceExporterTest >> synth [
    ^ PhMonoSynthPluginType new
]

{ #category : 'accessing' }
PhJuceExporterTest >> synthJSON [
    "Real JSON from: ((SquareOsc new freq: #freq) => (AREnv new trigger: #gate)) * gain"
    ^ '{"name":"MyApp","filename":"MyApp","inputs":0,"outputs":2,"ui":[{"type":"vgroup","label":"MyApp","items":[{"type":"hslider","label":"AREnvAttack","shortname":"AREnvAttack","address":"/MyApp/AREnvAttack","init":0.01,"min":0,"max":4,"step":0.001},{"type":"hslider","label":"AREnvRelease","shortname":"AREnvRelease","address":"/MyApp/AREnvRelease","init":0.1,"min":0.001,"max":2,"step":0.001},{"type":"hslider","label":"SquareOsc2uLevel","shortname":"SquareOsc2uLevel","address":"/MyApp/SquareOsc2uLevel","init":0.5,"min":0,"max":1,"step":0.001},{"type":"hslider","label":"freq","shortname":"freq","address":"/MyApp/freq","init":440,"min":20,"max":4086,"step":1},{"type":"hslider","label":"gain","shortname":"gain","address":"/MyApp/gain","init":0.5,"min":0,"max":1,"step":0.01},{"type":"button","label":"gate","shortname":"gate","address":"/MyApp/gate"}]}]}'
]

{ #category : 'tests' }
PhJuceExporterTest >> testApvtsControlsEffectKeepsAll [
    self
        assert: (dsp apvtsParameterControlsFrom: self synthJSON for: self effect) size
        equals: 6
]

{ #category : 'tests' }
PhJuceExporterTest >> testApvtsControlsSynthKeepsOnlyNonMidi [
    | kept |
    kept := dsp apvtsParameterControlsFrom: self synthJSON for: self synth.
    self
        assertCollection: (kept collect: [ :c | c at: #shortname ])
        hasSameElements: #( 'AREnvAttack' 'AREnvRelease' 'SquareOsc2uLevel' )
]

{ #category : 'tests' }
PhJuceExporterTest >> testCMakeDeclaresFormats [
    self assert: ((dsp asCMakeListsFor: self zitello type: self effect)
        includesSubstring: 'FORMATS AU VST3 Standalone')
]

{ #category : 'tests' }
PhJuceExporterTest >> testCMakeEffectFlags [
    | cmake |
    cmake := dsp asCMakeListsFor: self zitello type: self effect.
    self assert: (cmake includesSubstring: 'IS_SYNTH FALSE').
    self assert: (cmake includesSubstring: 'NEEDS_MIDI_INPUT FALSE').
    self assert: (cmake includesSubstring: 'VST3_CATEGORIES "Fx"').
    self assert: (cmake includesSubstring: 'AU_MAIN_TYPE "kAudioUnitType_Effect"')
]

{ #category : 'tests' }
PhJuceExporterTest >> testCMakeSynthFlags [
    | cmake |
    cmake := dsp asCMakeListsFor: self zitello type: self synth.
    self assert: (cmake includesSubstring: 'IS_SYNTH TRUE').
    self assert: (cmake includesSubstring: 'NEEDS_MIDI_INPUT TRUE').
    self assert: (cmake includesSubstring: 'VST3_CATEGORIES "Instrument"').
    self assert: (cmake includesSubstring: 'AU_MAIN_TYPE "kAudioUnitType_MusicDevice"')
]

{ #category : 'tests' }
PhJuceExporterTest >> testCMakeUsesIdentity [
    | cmake |
    cmake := dsp asCMakeListsFor: self zitello type: self synth.
    self assert: (cmake includesSubstring: 'project(Zitello VERSION').
    self assert: (cmake includesSubstring: 'PLUGIN_CODE Zite').
    self deny: (cmake includesSubstring: 'Fplu')
]

{ #category : 'tests' }
PhJuceExporterTest >> testJucerEffectFlags [
    | jucer |
    jucer := dsp asJucerFor: self zitello type: self effect.
    self assert: (jucer includesSubstring: 'pluginIsSynth="0"').
    self assert: (jucer includesSubstring: 'pluginWantsMidiInput="0"').
    self assert: (jucer includesSubstring: 'pluginVSTCategory="kPlugCategEffect"').
    self assert: (jucer includesSubstring: 'Source/FaustEffect.h')
]

{ #category : 'tests' }
PhJuceExporterTest >> testJucerUsesIdentity [
    | jucer |
    jucer := dsp asJucerFor: self zitello type: self synth.
    self assert: (jucer includesSubstring: 'pluginCode="Zite"').
    self assert: (jucer includesSubstring: 'bundleIdentifier="com.phausto.zitello"').
    self deny: (jucer includesSubstring: 'Fplu')
]

{ #category : 'tests' }
PhJuceExporterTest >> testParamsHeaderEffectHasSixRows [
    | header |
    header := dsp asPhaustoParamsHeaderFrom: self synthJSON for: self effect.
    self assert: (self descriptorRowsIn: header) size equals: 6
]

{ #category : 'tests' }
PhJuceExporterTest >> testParamsHeaderSynthHasThreeRows [
    | header |
    header := dsp asPhaustoParamsHeaderFrom: self synthJSON for: self synth.
    self assert: (self descriptorRowsIn: header) size equals: 3
]

{ #category : 'tests' }
PhJuceExporterTest >> testParamsHeaderSynthOmitsMidiDrivenControls [
    | header |
    header := dsp asPhaustoParamsHeaderFrom: self synthJSON for: self synth.
    #( '/MyApp/freq' '/MyApp/gate' '/MyApp/gain' ) do: [ :path |
        self deny: (header includesSubstring: path) description: path , ' leaked into APVTS' ]
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorCppEffectHasInputAndOutputBus [
    | cpp |
    cpp := dsp asPluginProcessorCppAPVTSFor: self effect.
    self assert: (cpp includesSubstring: 'withInput').
    self assert: (cpp includesSubstring: 'withOutput')
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorCppEffectHasNoMidi [
    | cpp |
    cpp := dsp asPluginProcessorCppAPVTSFor: self effect.
    self deny: (cpp includesSubstring: 'handleMidi').
    self deny: (cpp includesSubstring: 'currentNote')
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorCppSynthDefinesHandleMidi [
    | cpp |
    cpp := dsp asPluginProcessorCppAPVTSFor: self synth.
    self assert: (cpp includesSubstring: 'void MonoSynthAudioProcessor::handleMidi').
    self assert: (cpp includesSubstring: 'getMidiNoteInHertz').
    self deny: (cpp includesSubstring: '<PROC>')
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorCppSynthHandlesMidiBeforeCompute [
    | cpp midi compute |
    cpp := dsp asPluginProcessorCppAPVTSFor: self synth.
    midi := cpp indexOfSubCollection: 'handleMidi (midiMessages);'.
    compute := cpp indexOfSubCollection: 'fDSP.compute'.
    self assert: midi > 0.
    self assert: midi < compute
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorCppSynthHasOutputOnlyBus [
    | cpp |
    cpp := dsp asPluginProcessorCppAPVTSFor: self synth.
    self deny: (cpp includesSubstring: 'withInput').
    self assert: (cpp includesSubstring: 'withOutput')
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorHeaderEffectRejectsMidi [
    | header |
    header := dsp asPluginProcessorHeaderAPVTSFor: self effect.
    self assert: (header includesSubstring: 'acceptsMidi() const override { return false; }').
    self deny: (header includesSubstring: 'currentNote').
    self deny: (header includesSubstring: 'handleMidi')
]

{ #category : 'tests' }
PhJuceExporterTest >> testProcessorHeaderNamesFollowType [
    | header |
    header := dsp asPluginProcessorHeaderAPVTSFor: self synth.
    self assert: (header includesSubstring: '#include "FaustMonoSynth.h"').
    self assert: (header includesSubstring: 'class MonoSynthAudioProcessor')
]

{ #category : 'accessing' }
PhJuceExporterTest >> zitello [
    ^ PhPluginIdentity productName: 'Zitello'
]
