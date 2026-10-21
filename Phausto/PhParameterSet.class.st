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

{ #category : 'instance creation' }
PhParameterSet class >> fromJSON: aJsonString [
	"No FFI, no initialized DSP: tests pass a JSON string."

	^ self new
		initializeFromUI: ((STONJSON fromString: aJsonString) at: #ui);
		yourself
]

{ #category : 'as yet unclassified' }
PhParameterSet >> collectLeavesFrom: aSequence into: aCollection [
	"Moved from DSP >> apvtsCollectInto:from:. Groups have #items, leaves an #address."

	aSequence do: [ :node |
		(node includesKey: #items)
			ifTrue: [ self collectLeavesFrom: (node at: #items) into: aCollection ]
			ifFalse: [ (node includesKey: #address) ifTrue: [ aCollection add: node ] ] ]
]

{ #category : 'as yet unclassified' }
PhParameterSet >> ensureUniqueIDs [
	"APVTS keeps the first parameter with an id: a duplicate makes every later lookup wrong."

	(parameters collect: [ :each | each parameterID ]) asSet size = parameters size
		ifFalse: [ self error: 'Duplicate parameter IDs: the descriptor table would contain unreachable ids' ]
]

{ #category : 'as yet unclassified' }
PhParameterSet >> hostParametersFor: aPluginType [
	"What the APVTS exposes, so also what the JuBloc glue may attach to."

	^ parameters select: [ :each |
		each isHostParameter and: [ (aPluginType excludesParameter: each) not ] ]

]

{ #category : 'initialization' }
PhParameterSet >> initializeFromUI: aSequence [ 
	| leaves |
	leaves := OrderedCollection new.
	self collectLeavesFrom: aSequence into: leaves.
	parameters := (((leaves select: [ :each | PhParameter isParameterItem: each ])
		collect: [ :each | PhParameter fromFaustItem: each ])
		sorted: [ :a :b | a address <= b address ]) asArray.
	self ensureUniqueIDs
]

{ #category : 'accessing' }
PhParameterSet >> parameters [
	^ parameters
]
