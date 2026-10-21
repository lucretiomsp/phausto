"
I test the C++ float literals the *APVTS* export writes, and that a _PhParameter_ keeps its Faust address. The per-parameter C++ generators I used to test were replaced by the _PhaustoParams.h_ descriptor table; PhParameterSetTest covers its rows.
"
Class {
	#name : 'CppAPVTSTest',
	#superclass : 'TestCase',
	#instVars : [
		'json',
		'controls',
		'floatParam',
		'boolParam',
		'params'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'accessing' }
CppAPVTSTest >> json [
	"A slider whose label differs from its short name, a button, a MIDI-driven control and a meter."

	^ '{ "ui": [ { "type": "vgroup", "label": "synth", "items": [
		{ "type": "hslider", "label": "Cutoff", "shortname": "fxCutoff", "address": "/synth/fx/Cutoff", "init": 1000, "min": 20, "max": 20000, "step": 1 },
		{ "type": "button", "label": "gate", "shortname": "gate", "address": "/synth/gate" },
		{ "type": "hslider", "label": "freq", "shortname": "freq", "address": "/synth/freq", "init": 440, "min": 20, "max": 2000, "step": 1 },
		{ "type": "hbargraph", "label": "level", "shortname": "level", "address": "/synth/level", "min": 0, "max": 1 } ] } ] }'

]

{ #category : 'private' }
CppAPVTSTest >> rowsFor: aPluginType [
	"The Descriptor rows of the PhaustoParams.h the export writes for aPluginType."

	^ (DSP new asPhaustoParamsHeaderFrom: self json for: aPluginType) lines
		select: [ :each | each beginsWith: '        { "' ]
]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsFloats [

	self
		assert: (DSP new cppFloat: 0.3) equals: '0.3f';
		assert: (DSP new cppFloat: 0.001) equals: '0.001f'

]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsIntegers [

	self
		assert: (DSP new cppFloat: 1) equals: '1.0f';
		assert: (DSP new cppFloat: 8) equals: '8.0f';
		assert: (DSP new cppFloat: 0) equals: '0.0f'
]

{ #category : 'tests' }
CppAPVTSTest >> testFromFaustItemCapturesAddress [

	self
		assert: (PhParameter fromFaustItem: (Dictionary newFrom: {
			#type -> 'hslider'. #label -> 'X'. #shortname -> 'X'. #address -> '/MyApp/X'.
			#min -> 0. #max -> 1. #init -> 0.5. #step -> 0.01 })) address
		equals: '/MyApp/X'
]

{ #category : 'tests' }
CppAPVTSTest >> testHeaderHasOneRowPerHostParameter [
	"Meters never get a row; a MonoSynth also drops freq, gate and gain."

	self
		assert: (self rowsFor: PhEffectPluginType new) size equals: 3;
		assert: (self rowsFor: PhMonoSynthPluginType new) size equals: 1
]

{ #category : 'tests' }
CppAPVTSTest >> testRowFieldsAreIdPathThenLabel [
	"Label and short name differ here, so swapped fields would show."

	self
		assert: ((self rowsFor: PhEffectPluginType new) detect: [ :each | each includesSubstring: '"fxCutoff"' ])
		equals: '        { "fxCutoff", "/synth/fx/Cutoff", "Cutoff", 20.0f, 20000.0f, 1000.0f, 1.0f, false },'

]
