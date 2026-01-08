Class {
	#name : 'ParamSetterTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
ParamSetterTest >> setUp [
	super setUp.
   
	"Put here a common initialization logic for tests"
]

{ #category : 'tests' }
ParamSetterTest >> testSetAttackWithUGen [

	| env |
	env := AREnv new attack: LFOTriPos new.
	self assert: env attack  class equals: LFOTriPos 
]

{ #category : 'tests' }
ParamSetterTest >> testSetDecayWithSymbol [

	| env |
	env := ADSREnv new decay: #ShortDecay.
	self assert: env decay label equals: 'ShortDecay'
]

{ #category : 'tests' }
ParamSetterTest >> testSetFreqWithNumber [

	| oscillator |
	oscillator := SineOsc new freq: 200.
	self assert: oscillator freq  init  equals: 200
]
