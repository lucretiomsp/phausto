Class {
	#name : 'PhJuceAPVTSExportTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
PhJuceAPVTSExportTest >> setUp [ 
	"Six continuous controls in a flat vgroup, addresses prefixed /MyApp/."

	super setUp.
	dsp := (SquareOsc new => Korg35LPF new => ZitaRevStereo new) stereo asDsp.
	dsp init
]

{ #category : 'running' }
PhJuceAPVTSExportTest >> tearDown [ 

	dsp ifNotNil: [ dsp destroy ].
	dsp := nil.
	super tearDown
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testAllChainControlsBecomeParameters [ 
	"Nothing in this chain is an output or a soundfile, so nothing is dropped."

	self assert: dsp apvtsParameterControls size equals: 6
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testCollectorFindsEveryControl [ 

	self assert: dsp apvtsControls size equals: 6
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testCollectorRecursesIntoNestedGroups [ 
	"The chain produces a flat tree, so nesting needs its own DSP."

	self
		withDsp: 'import("stdfaust.lib");
process = hgroup("outer", vgroup("inner", _ * hslider("g", 0.5, 0, 1, 0.01)));'
		do: [ :d |
			self assert: (d apvtsControls
				anySatisfy: [ :c | (c at: #shortname) = 'g' ]) ]
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testCppFloatDefaultsForAbsentKeys [ 

	| c |
	c := Dictionary new.
	self assert: (dsp cppFloatAt: #min in: c default: 0) equals: '0.0f'.
	self assert: (dsp cppFloatAt: #max in: c default: 1) equals: '1.0f'
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testCppFloatLiterals [ 

	self assert: (dsp cppFloat: 1) equals: '1.0f'.
	self assert: (dsp cppFloat: 0.3) equals: '0.3f'
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testEmissionIsStable [ 
	"Two runs must be byte-identical or every export churns the diff."

	self
		assert: dsp asPhaustoParamsHeader
		equals: dsp asPhaustoParamsHeader
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testEveryControlCarriesBothNames [ 
	"address feeds MapUI, shortname feeds the APVTS. Both ends must be present
	 or the parameter is wired at one end only and silently does nothing."

	dsp apvtsControls do: [ :c |
		self assert: (c includesKey: #address).
		self assert: (c includesKey: #shortname) ]
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testEveryParameterReachesTheTable [ 
	"Both ends of every parameter must appear, or the control is dead at one end."

	| h |
	h := dsp asPhaustoParamsHeader.
	dsp apvtsParameterControls do: [ :c |
		self assert: (h includesSubstring: '"' , (c at: #shortname) , '"').
		self assert: (h includesSubstring: '"' , (c at: #address) , '"') ]
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testHeaderIsMarkedGenerated [ 
	"Source/ is overwritten on every export. The file must say so."

	self assert: (dsp asPhaustoParamsHeader includesSubstring: 'Do not edit')
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testHeaderStructure [ 

	| h |
	h := dsp asPhaustoParamsHeader.
	#( '#pragma once' 'namespace PhaustoParams' 'struct Descriptor'
	   'static const Descriptor table[]' 'static constexpr int count'
	   'createLayout()' 'AudioParameterBool' 'AudioParameterFloat' )
		do: [ :marker |
			self
				assert: (h includesSubstring: marker)
				description: 'header is missing ' , marker ]
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testLabelWithQuoteSignals [ 
	"If Faust rejects the escaped label at parse time this never reaches the
	 gatekeeper, the guard is unreachable, and both can be dropped."

	self
		should: [
			self
				withDsp: 'import("stdfaust.lib");
process = _ * hslider("say \\"hi\\"", 0.5, 0, 1, 0.01);'
				do: [ :d | d apvtsParameterControls ] ]
		raise: Error
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testPluginTypeIsNotHardcoded [ 

	| cpp |
	cpp := dsp asPluginProcessorCppAPVTSFor: 'MonoSynth'.
	self assert: (cpp includesSubstring: 'return new MonoSynthAudioProcessor()').
	self deny: (cpp includesSubstring: 'EffectAudioProcessor')

]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testProcessorCppNoLongerInterpolatesBodies [ 
"Under the table design the .cpp is static except for the class name. A stray layout.add means an old emitter survived the refactor."

	| cpp |
	cpp := dsp asPluginProcessorCppAPVTSFor: 'Effect'.
	self deny: (cpp includesSubstring: 'layout.add').
	self assert: (cpp includesSubstring: 'PhaustoParams::createLayout()')
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testProcessorCppUsesGeneratedEditor [ 
	"GenericAudioProcessorEditor here means PluginEditor.cpp is dead code."

	| cpp |
	cpp := dsp asPluginProcessorCppAPVTSFor: 'Effect'.
	self assert: (cpp includesSubstring: 'new EffectAudioProcessorEditor (*this)').
	self deny: (cpp includesSubstring: 'GenericAudioProcessorEditor')
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testRejectsBargraphs [ 
"A bargraph is an output. setParamValue on one is meaningless, and it must not become an automatable parameter."

	self
		withDsp: 'import("stdfaust.lib");
process = _ <: attach(_, hbargraph("meter", 0, 1)) , _;'
		do: [ :d |
			self assert: (d apvtsControls
				anySatisfy: [ :c | (c at: #type) = 'hbargraph' ]).
			self deny: (d apvtsParameterControls
				anySatisfy: [ :c | (c at: #type) = 'hbargraph' ]) ]

]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testRowCountMatchesParameterCount [ 

	| rows |
	rows := dsp asPhaustoParamsHeader lines select: [ :l |
		        l trimBoth beginsWith: '{ "' ].
	self assert: rows size equals: dsp apvtsParameterControls size
]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testSliderRowCarriesBothNamesAndFullRange [ 
	| control row |
	control := dsp apvtsParameterControls first.
	row := dsp apvtsDescriptorRowFor: control.
	self assert: (row includesSubstring: '"' , (control at: #shortname) , '"').
	self assert: (row includesSubstring: '"' , (control at: #address) , '"').
	self assert: (row includesSubstring: (dsp cppFloat: (control at: #min))).
	self assert: (row includesSubstring: (dsp cppFloat: (control at: #max))).
	self assert: (row includesSubstring: (dsp cppFloat: (control at: #init))).
	self assert: (row includesSubstring: 'false')

]

{ #category : 'tests' }
PhJuceAPVTSExportTest >> testToggleRowSurvivesMissingRangeKeys [ 
"Faust emits no min/max/init/step for buttons and checkboxes. The emitter must fall back to defaults rather than DNU, and must mark them isToggle."

	self
		withDsp: 'import("stdfaust.lib");
process = _ * checkbox("mute") : _ * button("gate");'
		do: [ :d |
			d apvtsParameterControls do: [ :c |
				| row |
				row := d apvtsDescriptorRowFor: c.
				self assert: (row includesSubstring: 'true') ] ]
]

{ #category : 'running' }
PhJuceAPVTSExportTest >> withDsp: aFaustString do: aBlock [ 
	"Per-test DSP for shapes the UGen chain cannot produce. Always destroyed."

	| d |
	d := DSP create: aFaustString.
	d init.
	^ [ aBlock value: d ] ensure: [ d destroy ]
]
