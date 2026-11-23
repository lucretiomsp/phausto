"
I test the Parameters inspector of DSPParameterStore and DSP. My DSPs are initialized but never started: no sound, and I never open a window, so the polling process never runs (refresh is called directly).
"
Class {
	#name : 'DSPParameterStoreInspectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp',
		'store',
		'presenter'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
DSPParameterStoreInspectorTest >> controlsSource [

	^ 'import("stdfaust.lib");
process = os.osc(hslider("freq", 440, 20, 2000, 1)) * checkbox("on") * button("gate")
	: hbargraph("level", 0, 1);'
]

{ #category : 'running' }
DSPParameterStoreInspectorTest >> setUpOn: aDSP [

	dsp := aDSP.
	dsp init.
	store := dsp parameterStore.
	presenter := store inspectionParameters
]

{ #category : 'running' }
DSPParameterStoreInspectorTest >> setUpSquareOsc [

	self setUpOn: SquareOsc new asDsp
]

{ #category : 'running' }
DSPParameterStoreInspectorTest >> tearDown [

	presenter ifNotNil: [ presenter stopPolling ].
	super tearDown
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testButtonHoldAndTrig [

	| gate |
	self setUpOn: (DSP create: self controlsSource).
	gate := presenter rowFor: 'gate'.
	gate holdButton state: true.
	self assert: (store valueOf: gate parameter) equals: 1.
	gate holdButton state: false.
	self assert: (store valueOf: gate parameter) equals: 0.
	gate trig.
	self assert: (store valueOf: gate parameter) equals: 1.
	50 milliSeconds wait.
	self assert: (store valueOf: gate parameter) equals: 0
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testCheckBoxWritesTheDSP [

	| on |
	self setUpOn: (DSP create: self controlsSource).
	on := presenter rowFor: 'on'.
	on control state: true.
	self assert: (store valueOf: on parameter) equals: 1.
	on control state: false.
	self assert: (store valueOf: on parameter) equals: 0
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testDSPHasAParametersTab [

	dsp := SquareOsc new asDsp.
	dsp init.
	presenter := dsp inspectionParameters.
	self assert: (presenter isKindOf: DSPParameterStoreInspectorPresenter).
	self assert: presenter rows size equals: 2
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testMeterIsReadOnly [

	| level |
	self setUpOn: (DSP create: self controlsSource).
	level := presenter rowFor: 'level'.
	self assert: level control class equals: SpProgressBarPresenter.
	self should: [ store setValue: 0.5 of: level parameter ] raise: Error.
	level refresh.
	self assert: level valueField label equals: '0.000'
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testOneRowPerParameterInAddressOrder [

	self setUpSquareOsc.
	self
		assert: (presenter rows collect: [ :each | each parameter address ]) asArray
		equals: (store sortedParameters collect: [ :each | each address ]).
	self
		assert: (presenter rows collect: [ :each | each parameter label ]) asSet
		equals: #( 'SquareOscFreq' 'SquareOscuLevel' ) asSet
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testRefreshReadsTheDSPWithoutWritingBack [

	| freq |
	self setUpSquareOsc.
	freq := presenter rowFor: 'SquareOscFreq'.
	dsp setValue: 300 parameterIndex: (store indexOf: freq parameter).
	presenter refresh.
	self assert: freq control value equals: 300.
	self assert: freq valueField number equals: 300.
	self assert: (store valueOf: freq parameter) equals: 300
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testResetToDefaults [

	| freq |
	self setUpSquareOsc.
	freq := presenter rowFor: 'SquareOscFreq'.
	freq control value: 1000.
	presenter resetToDefaults.
	self assert: (store valueOf: freq parameter) equals: 440.
	self assert: freq control value equals: 440
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testSliderShowsTheInitValue [

	self setUpSquareOsc.
	self assert: (presenter rowFor: 'SquareOscFreq') control value equals: 440.
	self assert: (presenter rowFor: 'SquareOscFreq') control min equals: 20.
	self assert: (presenter rowFor: 'SquareOscFreq') control max equals: 4086
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testSliderWritesTheDSP [

	| freq |
	self setUpSquareOsc.
	freq := presenter rowFor: 'SquareOscFreq'.
	freq control value: 880.
	self assert: (store valueOf: freq parameter) equals: 880.
	self assert: freq valueField number equals: 880
]

{ #category : 'tests' }
DSPParameterStoreInspectorTest >> testWritesAreClampedToTheDeclaredRange [

	| freq |
	self setUpSquareOsc.
	freq := presenter rowFor: 'SquareOscFreq'.
	freq write: 99999.
	self assert: (store valueOf: freq parameter) equals: 4086.
	self assert: freq control value equals: 4086.
	freq write: -5.
	self assert: (store valueOf: freq parameter) equals: 20
]
