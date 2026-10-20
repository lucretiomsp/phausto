"
I am every parameter of one DSP, parsed once from its Faust JSON (fromJSON:) and sorted by address, so generated files are byte-stable.

I skip soundfiles, which are not parameters. I fail loudly on duplicate parameter IDs: the APVTS keeps only the first one, and every later lookup would answer the wrong parameter.

hostParametersFor: answers what the APVTS exposes: no meters, and none of the controls the plugin type drives by MIDI. The JUCE exporter and the JuBloc glue both use it, so a slider never attaches to an ID the APVTS lacks.

Pattern: First-Class Collection. I own the ID invariant and the one filter both consumers share.
"
Class {
	#name : 'PhParameterSet',
	#superclass : 'Object',
	#instVars : [
		'parameters'
	],
	#category : 'Phausto-Parameters',
	#package : 'Phausto',
	#tag : 'Parameters'
}

{ #category : 'initialization' }
PhParameterSet >> initializeFromUI: aSequence [

	| leaves |
	leaves := OrderedCollection new.
	self collectLeavesFrom: aSequence into: leaves.
	parameters := (((leaves select: [ :each | PhControlKind isParameterItem: each ])
		collect: [ :each | PhParameter fromFaustItem: each ])
		sorted: [ :a :b | a address <= b address ]) asArray.
	self ensureUniqueIDs
]
