Class {
	#name : 'PhParameterSetTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'private - accessing' }
PhParameterSetTest >> json [
	"Every Faust control type once, plus a soundfile, inside a group."

	^ '{ "ui": [ { "type": "vgroup", "label": "fx", "items": [
	{ "type": "hslider", "label": "mix", "shortname": "mix", "address": "/fx/mix", "init": 0.5, "min": 0, "max": 1, "step": 0.01 },
	{ "type": "hslider", "label": "cutoff", "shortname": "cutoff", "address": "/fx/cutoff",
	  "meta": [ { "style": "knob" }, { "unit": "Hz" } ], "init": 1000, "min": 20, "max": 20000, "step": 1 },
	{ "type": "vslider", "label": "gain", "shortname": "gain", "address": "/fx/gain", "init": 0.5, "min": 0, "max": 1, "step": 0.01 },
	{ "type": "nentry", "label": "mode", "shortname": "mode", "address": "/fx/mode", "init": 0, "min": 0, "max": 3, "step": 1 },
	{ "type": "button", "label": "gate", "shortname": "gate", "address": "/fx/gate" },
	{ "type": "checkbox", "label": "bypass", "shortname": "bypass", "address": "/fx/bypass" },
	{ "type": "hbargraph", "label": "level", "shortname": "level", "address": "/fx/level", "min": 0, "max": 1 },
	{ "type": "vbargraph", "label": "peak", "shortname": "peak", "address": "/fx/peak", "min": 0, "max": 1 },
	{ "type": "soundfile", "label": "sample", "url": "kick.wav", "address": "/fx/sample" } ] } ] }'

]

{ #category : 'private - accessing' }
PhParameterSetTest >> parameterNamed: aString [

	^ self parameterSet parameters detect: [ :each | each shortName = aString ]
]

{ #category : 'private - accessing' }
PhParameterSetTest >> parameterSet [

	^ PhParameterSet fromJSON: self json
]

{ #category : 'tests' }
PhParameterSetTest >> testDescriptorRowsCarryTheExportDefaults [
	"The rows PhaustoParams.h gets for a toggle and a slider."

	self
		assert: (DSP new apvtsDescriptorRowFor: (self parameterNamed: 'gate'))
		equals: '        { "gate", "/fx/gate", "gate", 0.0f, 1.0f, 0.0f, 0.01f, true },';
		assert: (DSP new apvtsDescriptorRowFor: (self parameterNamed: 'cutoff'))
		equals: '        { "cutoff", "/fx/cutoff", "cutoff", 20.0f, 20000.0f, 1000.0f, 1.0f, false },'


]

{ #category : 'tests' }
PhParameterSetTest >> testDuplicateIDsFailLoudly [

	self
		should: [ PhParameterSet fromJSON: '{ "ui": [
			{ "type": "hslider", "label": "f", "shortname": "f", "address": "/a/f" },
			{ "type": "hslider", "label": "f", "shortname": "f", "address": "/b/f" } ] }' ]
		raise: Error
]

{ #category : 'tests' }
PhParameterSetTest >> testEffectHostsEverythingButMeters [

	self
		assert: ((self parameterSet hostParametersFor: PhEffectPluginType new)
			collect: [ :each | each shortName ])
		equals: #( 'bypass' 'cutoff' 'gain' 'gate' 'mix' 'mode' )
]

{ #category : 'tests' }
PhParameterSetTest >> testMonoSynthLeavesMidiDrivenParametersOut [

	self
		assert: ((self parameterSet hostParametersFor: PhMonoSynthPluginType new)
			collect: [ :each | each shortName ])
		equals: #( 'bypass' 'cutoff' 'mix' 'mode' )
]

{ #category : 'tests' }
PhParameterSetTest >> testParameterIDIsTheShortname [

	self assert: (self parameterNamed: 'cutoff') parameterID equals: 'cutoff'

]

{ #category : 'tests' }
PhParameterSetTest >> testSoundfilesAreSkippedAndTheRestSortedByAddress [

	self
		assert: (self parameterSet parameters collect: [ :each | each address ])
		equals: #( '/fx/bypass' '/fx/cutoff' '/fx/gain' '/fx/gate' '/fx/level' '/fx/mix' '/fx/mode' '/fx/peak' )

]

{ #category : 'tests' }
PhParameterSetTest >> testStyleComesFromMeta [

	self
		assert: (self parameterNamed: 'cutoff') style equals: 'knob';
		assert: (self parameterNamed: 'gain') style equals: ''

]

{ #category : 'tests' }
PhParameterSetTest >> testTogglesGetTheExportDefaults [
	"Faust omits min, max, init and step on buttons and checkboxes."

	| gate |
	gate := self parameterNamed: 'gate'.
	self
		assert: gate isToggle;
		assert: gate minValue equals: 0;
		assert: gate maxValue equals: 1;
		assert: gate initValue equals: 0;
		assert: gate stepValue equals: 0.01
]

{ #category : 'tests' }
PhParameterSetTest >> testUnknownTypeFailsLoudly [

	self
		should: [ PhParameterSet fromJSON: '{ "ui": [ { "type": "dial", "label": "x", "shortname": "x", "address": "/x" } ] }' ]
		raise: Error
]
