Class {
	#name : 'PhPluginTypeTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'private' }
PhPluginTypeTest >> parameterNamed: aShortName at: anAddress [
	"A plain hslider, as Faust would declare it."

	^ PhParameter fromFaustItem: (Dictionary newFrom: {
		#type -> 'hslider'.
		#label -> aShortName.
		#shortname -> aShortName.
		#address -> anAddress })
]

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
		assertCollection: (kept collect: [ :each | each shortName ])
		hasSameElements: #( 'AREnvAttack' 'AREnvRelease' 'SquareOsc2uLevel' )
]

{ #category : 'tests' }
PhPluginTypeTest >> testChannelErrorNamesTypeAndCounts [
	"The message is what a workshop attendee reads in the debugger."

	self
		should: [ PhEffectPluginType new checkInputs: 4 outputs: 2 ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'Effect').
			self assert: (error messageText includesSubstring: '4 and 2') ]
]

{ #category : 'tests' }
PhPluginTypeTest >> testEffectAcceptsUpToStereoEachWay [

	| effect |
	effect := PhEffectPluginType new.
	#( #( 1 2 ) #( 2 2 ) #( 1 1 ) #( 2 1 ) #( 0 2 ) ) do: [ :counts |
		self
			shouldnt: [ effect checkInputs: counts first outputs: counts last ]
			raise: Error
			description: 'Effect rejected ' , counts printString ]
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

	self deny: (PhEffectPluginType new excludesParameter: (self parameterNamed: 'freq' at: '/fx/freq'))

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
PhPluginTypeTest >> testEffectRejectsMoreThanStereo [

	| effect |
	effect := PhEffectPluginType new.
	self should: [ effect checkInputs: 4 outputs: 2 ] raise: Error.
	self should: [ effect checkInputs: 2 outputs: 4 ] raise: Error
]

{ #category : 'tests' }
PhPluginTypeTest >> testEveryTypeNamesItsArchitecture [

	self assert: PhEffectPluginType new faustArchitectureFileName equals: 'faustMinimalInlined.h'.
	self assert: PhMonoSynthPluginType new faustArchitectureFileName equals: 'faustMinimalInlined.h'.
	self assert: PhPolySynthPluginType new faustArchitectureFileName equals: 'faustMinimalPolyInlined.h'
]

{ #category : 'tests' }
PhPluginTypeTest >> testFromStringEffect [ 
	self assert: (PhPluginType fromString: 'Effect') class equals: PhEffectPluginType 

]

{ #category : 'tests' }
PhPluginTypeTest >> testFromStringMonoSynth [

	self assert: (PhPluginType fromString: 'MonoSynth') class equals: PhMonoSynthPluginType
]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoProcessorOwnsItsDsp [

	| cpp |
	cpp := (DSP new name: 'MyApp') asPluginProcessorCppAPVTSFor: PhMonoSynthPluginType new.
	self assert: (cpp includesSubstring: 'fDSP = std::make_unique<mydsp>();').
	self deny: (cpp includesSubstring: 'mydsp_poly')
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

	#( 'freq' 'gate' 'gain' ) do: [ :each |
		self assert: (PhMonoSynthPluginType new excludesParameter: (self parameterNamed: each at: '/synth/' , each)) ]

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

	self deny: (PhMonoSynthPluginType new excludesParameter: (self parameterNamed: 'cutoff' at: '/synth/cutoff'))
]

{ #category : 'tests' }
PhPluginTypeTest >> testMonoSynthRejectsAudioInputs [

	| synth |
	synth := PhMonoSynthPluginType new.
	self should: [ synth checkInputs: 1 outputs: 2 ] raise: Error.
	synth checkInputs: 0 outputs: 2
]

{ #category : 'private' }
PhPluginTypeTest >> testPolyExcludesThePolyWrapperControls [

	| poly |
	poly := PhPolySynthPluginType new.
	self
		assert: (poly excludesParameter: (self parameterNamed: 'Panic' at: '/Polyphonic/Voices/Panic'));
		assert: (poly excludesParameter: (self parameterNamed: 'V1/cutoff' at: '/Polyphonic/V1/MyApp/cutoff'));
		assert: (poly excludesParameter: (self parameterNamed: 'freq' at: '/MyApp/freq'));
		deny: (poly excludesParameter: (self parameterNamed: 'cutoff' at: '/Polyphonic/Voices/MyApp/cutoff'));
		deny: (poly excludesParameter: (self parameterNamed: 'cutoff' at: '/MyApp/cutoff'))
]

{ #category : 'tests' }
PhPluginTypeTest >> testPolyProcessorBuildsAndFeedsTheVoices [

	| cpp |
	cpp := (DSP new name: 'MyApp') asPluginProcessorCppAPVTSFor: (PhPolySynthPluginType voices: 12).
	self assert: (cpp includesSubstring: '#include "FaustPolySynth.h"').
	self assert: (cpp includesSubstring: 'new mydsp_poly (new mydsp(), 12, true)').
	self assert: (cpp includesSubstring: 'voiceZones').
	self assert: (cpp includesSubstring: 'juce::jmin (samplesPerBlock, MIX_BUFFER_SIZE)').
	self deny: (cpp includesSubstring: 'fUI->setParamValue').
	self deny: (cpp includesSubstring: 'updateAllGuis')
]

{ #category : 'tests' }
PhPluginTypeTest >> testPolyVoicesConfiguresTheType [

	self assert: (PhPolySynthPluginType voices: 12) voiceCount equals: 12.
	self assert: PhPolySynthPluginType new voiceCount equals: 8.
	self should: [ PhPolySynthPluginType voices: 1 ] raise: Error
]

{ #category : 'tests' }
PhPluginTypeTest >> testPolyVoicesDefaultAndMinimum [

	self
		assert: PhPolySynthPluginType new voiceCount equals: 8;
		assert: (PhPolySynthPluginType new voices: 4) voiceCount equals: 4;
		should: [ PhPolySynthPluginType new voices: 1 ] raise: Error
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
PhPluginTypeTest >> testProcessorHeaderNeverIncludesTheFaustHeader [
	"PluginEditor.cpp includes PluginProcessor.h. The poly architecture defines symbols, so including it there too would define them twice."

	| dsp |
	dsp := DSP new name: 'MyApp'.
	{ PhEffectPluginType new. PhMonoSynthPluginType new. PhPolySynthPluginType new } do: [ :type |
		self deny: ((dsp asPluginProcessorHeaderAPVTSFor: type) includesSubstring: '#include "Faust') ]
]

{ #category : 'tests' }
PhPluginTypeTest >> testProcessorHeaderRejectsMidiForEffect [ 
	| dsp header |
	dsp := DSP new name: 'MyApp'.
	header := dsp asPluginProcessorHeaderAPVTSFor: PhEffectPluginType new.
	self assert: (header includesSubstring: 'acceptsMidi() const override { return false; }').
	self deny: (header includesSubstring: 'currentNote')
]
