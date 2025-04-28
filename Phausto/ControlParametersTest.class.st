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
	osci := SineOsc new.
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
	.
	osci controlParameters at: #freq add: (osci freq
		asControlParameterOfWidgetType: #knob
		description: 'Frequency in Hertz').
	freqParam := osci controlParameters at: #freq.
	self assert: freqParam min equals: osci freq min.
	self assert: freqParam max equals: osci freq max.
	self assert: freqParam step equals: osci freq step.
	self assert: freqParam knob equals: #knob.
	self assert: freqParam description: 'Frequency in Hertz'.
	self assert: freqParam initialValue equals: osci freq init
]
