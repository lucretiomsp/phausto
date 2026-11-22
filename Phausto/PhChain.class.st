"
Creates a chain of bidirectional blocks. Blocks must have 3 inputs and outputs. The first input/output carry left going waves, the second input/output carry right going waves, and the third input/output is used to carry any potential output signal to the end of the algorithm.
"
Class {
	#name : 'PhChain',
	#superclass : 'PhPmElement',
	#instVars : [
		'blocks'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
PhChain class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#blocks -> 'the bidirectional blocks of the chain (3 in / 3 out each)' }
]

{ #category : 'faust' }
PhChain class >> argumentNames [

	^ #( #blocks )
]

{ #category : 'faust' }
PhChain class >> faustName [

	^ 'chain'
]

{ #category : 'accessing' }
PhChain >> blocks [

	^ blocks
]

{ #category : 'accessing' }
PhChain >> blocks: aCollection [

	blocks := aCollection asOrderedCollection
]

{ #category : 'connecting' }
PhChain >> chainWith: aBidirectionalBlock [

	"a chain followed by a block is the same chain, one block longer"

	(aBidirectionalBlock isKindOf: PhChain)
		ifTrue: [ blocks addAll: aBidirectionalBlock blocks ]
		ifFalse: [ blocks add: aBidirectionalBlock ]
]

{ #category : 'faust' }
PhChain >> faustCall [

	"pm.chain(A : B : ...) is pattern matched by the Faust compiler, so the blocks are written with the sequential operator"

	^ String streamContents: [ :stream |
		stream << 'pm.chain('.
		blocks
			do: [ :each | stream << each asFaustArgument ]
			separatedBy: [ stream << ' : ' ].
		stream << ')' ]
]

{ #category : 'initialization' }
PhChain >> initializeArguments [

	blocks := OrderedCollection with: InLeftRightWave new with: PhBasicBlock new
]
