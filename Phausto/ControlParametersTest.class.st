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
