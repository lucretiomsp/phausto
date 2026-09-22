Class {
	#name : 'PhPluginTypeTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhPluginTypeTest >> synthJSON [ 
	"The actual JSON from: SquareOsc new freq: #freq => AREnv new trigger: #gate * gain"
	^ '{"name":"MyApp","filename":"MyApp","inputs":0,"outputs":2,"ui":[{"type":"vgroup","label":"MyApp","items":[{"type":"hslider","label":"AREnvAttack","shortname":"AREnvAttack","address":"/MyApp/AREnvAttack","init":0.01,"min":0,"max":4,"step":0.001},{"type":"hslider","label":"AREnvRelease","shortname":"AREnvRelease","address":"/MyApp/AREnvRelease","init":0.1,"min":0.001,"max":2,"step":0.001},{"type":"hslider","label":"SquareOsc2uLevel","shortname":"SquareOsc2uLevel","address":"/MyApp/SquareOsc2uLevel","init":0.5,"min":0,"max":1,"step":0.001},{"type":"hslider","label":"freq","shortname":"freq","address":"/MyApp/freq","init":440,"min":20,"max":4086,"step":1},{"type":"hslider","label":"gain","shortname":"gain","address":"/MyApp/gain","init":0.5,"min":0,"max":1,"step":0.01},{"type":"button","label":"gate","shortname":"gate","address":"/MyApp/gate"}]}]}'

]

{ #category : 'tests' }
PhPluginTypeTest >> testApvtsFilteringForEffect [ 
	"Effect keeps all 6 controls."
	| dsp kept |
	dsp := DSP new name: 'MyApp'.
	kept := dsp apvtsParameterControlsFrom: self synthJSON for: PhEffectPluginType new.
	self assert: kept size equals: 6
]

{ #category : 'tests' }
PhPluginTypeTest >> testApvtsFilteringForMonoSynth [ 
	"MonoSynth keeps only the 3 non-MIDI controls."
	| dsp kept |
	dsp := DSP new name: 'MyApp'.
	kept := dsp apvtsParameterControlsFrom: self synthJSON for: PhMonoSynthPluginType new.
	self assert: kept size equals: 3.
	self
		assertCollection: (kept collect: [ :c | c at: #shortname ])
		hasSameElements: #( 'AREnvAttack' 'AREnvRelease' 'SquareOsc2uLevel' )
]

{ #category : 'tests' }
PhPluginTypeTest >> testEffectBusesHasInput [ 
	| buses |
	buses := PhEffectPluginType new busesPropertiesCpp.
	self assert: (buses includesSubstring: 'withInput').
	self assert: (buses includesSubstring: 'withOutput')
]

{ #category : 'tests' }
PhPluginTypeTest >> testEffectExcludesNothing [ 
	| ctrl |
	ctrl := Dictionary new at: #shortname put: 'freq'; yourself.
	self deny: (PhEffectPluginType new excludesControl: ctrl)
]

{ #category : 'tests' }
PhPluginTypeTest >> testEffectFacts [ 

	| t |
	t := PhEffectPluginType new.
	self deny: t isSynth.
	self deny: t acceptsMidi.
	self assert: t hasAudioInput.
	self assert: t vst3Category equals: 'Fx'
]

{ #category : 'tests' }
PhPluginTypeTest >> testFromStringEffect [ 
	self assert: (PhPluginType fromString: 'Effect') class equals: PhEffectPluginType class

]

{ #category : 'tests' }
PhPluginTypeTest >> testFromStringMonoSynth [ 
	self assert: (PhPluginType fromString: 'MonoSynth') class equals: PhMonoSynthPluginType class

]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoSynthBusesHasNoInput [ 
	| buses |
	buses := PhMonoSynthPluginType new busesPropertiesCpp.
	self deny: (buses includesSubstring: 'withInput').
	self assert: (buses includesSubstring: 'withOutput')
]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoSynthExcludesFreqGateGain [ 
	#( 'freq' 'gate' 'gain' ) do: [ :name |
		| ctrl |
		ctrl := Dictionary new at: #shortname put: name; yourself.
		self assert: (PhMonoSynthPluginType new excludesControl: ctrl) ]
]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoSynthFacts [ 
	| t |
	t := PhMonoSynthPluginType new.
	self assert: t isSynth.
	self assert: t acceptsMidi.
	self deny: t hasAudioInput.
	self assert: t vst3Category equals: 'Instrument'

]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoSynthKeepsOtherControls [ 
	| ctrl |
	ctrl := Dictionary new at: #shortname put: 'cutoff'; yourself.
	self deny: (PhMonoSynthPluginType new excludesControl: ctrl)
]

{ #category : 'tests' }
PhPluginTypeTest >> testProcessorCppEffectHasNoMidi [ 
	| dsp cpp |
	dsp := DSP new name: 'MyApp'.
	cpp := dsp asPluginProcessorCppAPVTSFor: PhEffectPluginType new.
	self deny: (cpp includesSubstring: 'handleMidi').
	self deny: (cpp includesSubstring: 'currentNote')
]

{ #category : 'tests' }
PhPluginTypeTest >> testProcessorCppSynthHasHandleMidi [ 
	| dsp cpp |
	dsp := DSP new name: 'MyApp'.
	cpp := dsp asPluginProcessorCppAPVTSFor: PhMonoSynthPluginType new.
	self assert: (cpp includesSubstring: 'handleMidi (midiMessages)').
	self assert: (cpp includesSubstring: 'void MonoSynthAudioProcessor::handleMidi').
	self assert: (cpp includesSubstring: 'getMidiNoteInHertz')
]

{ #category : 'tests' }
PhPluginTypeTest >> testProcessorHeaderAcceptsMidiForSynth [ 
	| dsp header |
	dsp := DSP new name: 'MyApp'.
	header := dsp asPluginProcessorHeaderAPVTSFor: PhMonoSynthPluginType new.
	self assert: (header includesSubstring: 'acceptsMidi() const override { return true; }').
	self assert: (header includesSubstring: 'int currentNote').
	self assert: (header includesSubstring: 'void handleMidi')
]

{ #category : 'tests' }
PhPluginTypeTest >> testProcessorHeaderRejectsMidiForEffect [ 
	| dsp header |
	dsp := DSP new name: 'MyApp'.
	header := dsp asPluginProcessorHeaderAPVTSFor: PhEffectPluginType new.
	self assert: (header includesSubstring: 'acceptsMidi() const override { return false; }').
	self deny: (header includesSubstring: 'currentNote')
]
