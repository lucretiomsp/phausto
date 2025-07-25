Class {
	#name : 'ControlParametersTest',
	#superclass : 'TestCase',
	#instVars : [
		'osci'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
ControlParametersTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	osci := SineOsc new label: 'SineOsc'
]

{ #category : 'tests' }
ControlParametersTest >> testChangeControlParameterLabel [

| freqParam |
osci freq: #OsciFreq.
freqParam :=  osci controlParameters at: #freq .
	self assert:   freqParam label  equals: 'OsciFreq'
]

{ #category : 'tests' }
ControlParametersTest >> testInitializeControlParameterFromUIPrimitive [

	| freqParam |
	osci controlParameters add: #freq -> (osci freq
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').
	freqParam := osci controlParameters at: #freq.
	self assert: freqParam min equals: osci freq min.
	self assert: freqParam max equals: osci freq max.
	self assert: freqParam step equals: osci freq step.
	self assert: freqParam widgetType equals: #knob.
	self assert: freqParam description equals:  'Frequency in Hertz'.
	self assert: freqParam initialValue equals: osci freq init
]

{ #category : 'tests' }
ControlParametersTest >> testLFOForFreq [

osci freq: (LFOTriPos  new label: 'Lfo').


self assert: (osci controlParameters includesKey: #uLevel)
]
