Class {
	#name : 'PhJuceExportIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> assertProjectFilesFor: aPluginType [
    { 'CMakeLists.txt'. self exportName , '.jucer' } do: [ :f |
        self assert: (self exportFolder / f) exists description: f , ' missing' ].
    { 'PhaustoParams.h'. 'PluginProcessor.h'. 'PluginProcessor.cpp'.
      'PluginEditor.h'. 'PluginEditor.cpp'. 'Faust' , aPluginType typeName , '.h' } do: [ :f |
        self assert: (self exportFolder / 'Source' / f) exists description: f , ' missing' ]
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> contentsOf: aFileName [
    ^ (self exportFolder / aFileName) contents
]

{ #category : 'accessing' }
PhJuceExportIntegrationTest >> effect [
       ^ PhEffectPluginType new
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> effectDsp [
    | d |
    d := (PhResonLp new frequency: #Cutoff; q: #Resonance; yourself) stereo asDsp.
    d init.
    ^ d
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> exportFolder [
    ^ FileLocator documents / 'faust2Juce' / self exportName
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> exportName [
    ^ 'PhExportTestPlugin'
]

{ #category : 'running' }
PhJuceExportIntegrationTest >> setUp [
    super setUp.
    dsp := DSP new name: 'MyApp'
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> sourceContentsOf: aFileName [
    ^ (self exportFolder / 'Source' / aFileName) contents
]

{ #category : 'accessing' }
PhJuceExportIntegrationTest >> synth [

	^ PhMonoSynthPluginType new
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> synthDsp [
    | d |
    d := (((SquareOsc new freq: #freq) => (AREnv new trigger: #gate))
        * (PhHSlider new label: #gain)) stereo asDsp.
    d init.
    ^ d
]

{ #category : 'running' }
PhJuceExportIntegrationTest >> tearDown [
    dsp ifNotNil: [ dsp destroy ].
    self exportFolder ensureDeleteAll.
    super tearDown
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> testExportEffectWiresTypeIntoEveryFile [
    dsp := self effectDsp.
    dsp export2JuceWithName: self exportName type: PhEffectPluginType new.
    self assert: ((self contentsOf: 'CMakeLists.txt') includesSubstring: 'IS_SYNTH FALSE').
    self assert: ((self contentsOf: self exportName , '.jucer') includesSubstring: 'pluginIsSynth="0"').
    self deny: ((self sourceContentsOf: 'PluginProcessor.h') includesSubstring: 'handleMidi').
    self assert: ((self sourceContentsOf: 'PluginProcessor.cpp') includesSubstring: 'withInput').
    self assert: ((self sourceContentsOf: 'PhaustoParams.h') includesSubstring: '"Cutoff"')
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> testExportEffectWritesAllFiles [
    dsp := self effectDsp.
    dsp export2JuceWithName: self exportName type: PhEffectPluginType new.
    self assertProjectFilesFor: PhEffectPluginType new
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> testExportMonoSynthWiresTypeIntoEveryFile [
    dsp := self synthDsp.
    dsp export2JuceWithName: self exportName type: PhMonoSynthPluginType new.
    self assert: ((self contentsOf: 'CMakeLists.txt') includesSubstring: 'IS_SYNTH TRUE').
    self assert: ((self contentsOf: self exportName , '.jucer') includesSubstring: 'pluginIsSynth="1"').
    self assert: ((self sourceContentsOf: 'PluginProcessor.h') includesSubstring: 'void handleMidi').
    self assert: ((self sourceContentsOf: 'PluginProcessor.cpp') includesSubstring: 'handleMidi (midiMessages);').
    self deny: ((self sourceContentsOf: 'PluginProcessor.cpp') includesSubstring: 'withInput').
    self deny: ((self sourceContentsOf: 'PhaustoParams.h') includesSubstring: '/freq"')
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> testExportMonoSynthWritesAllFiles [
    dsp := self synthDsp.
    dsp export2JuceWithName: self exportName type: PhMonoSynthPluginType new.
    self assertProjectFilesFor: PhMonoSynthPluginType new
]

{ #category : 'helpers' }
PhJuceExportIntegrationTest >> testProcessorCppNeedsNoFaustIncludePath [

	{
		self effect.
		self synth } do: [ :type |
			self
				deny:
					((dsp asPluginProcessorCppAPVTSFor: type) includesSubstring:
						 'faust/gui/')
				description: type typeName , ' includes a faust/gui header' ]
]
