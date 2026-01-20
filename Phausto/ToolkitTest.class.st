Class {
	#name : 'ToolkitTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
ToolkitTest >> testPHSelectNAsDsp [

| oscillators |
oscillators := {  SineOsc new . SquareOsc new . PulseOsc new  . TriOsc new . Noise new} asPhList .
self deny: (PhSelectN new list: oscillators) asDsp isNull
]

{ #category : 'tests' }
ToolkitTest >> testPhCaptureAsDsp [



	self assert: PhCapture new asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPhCounterAsDsp [

	self deny: PhTkCounter new asDsp  isNull 
]

{ #category : 'tests' }
ToolkitTest >> testPhEndRoutingDsp [

	self deny: PhEndRouting new asDsp isNull
]

{ #category : 'tests' }
ToolkitTest >> testPhListAsDsp [

	| list |
	list := PhList new addAll: #(1 2 3).
	self assert: list asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPhListCountingFromZero [

| list |

list := PhList new countingFromZero addAll: #(1 2 3 4).
self assert: list size equals: 4.
]

{ #category : 'tests' }
ToolkitTest >> testPhMemDsp [

	self deny: PhMem new asDsp isNull
]

{ #category : 'tests' }
ToolkitTest >> testPhPostRoutingDsp [

	self deny: PhPostRouting new asDsp isNull
]

{ #category : 'tests' }
ToolkitTest >> testPhPreRoutingDsp [

	self deny: PhPreRouting new asDsp isNull
]

{ #category : 'tests' }
ToolkitTest >> testPhSubBeatAsDsp [

	self assert: PhSubBeat new asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPulseGateAsDsp [

self assert: PulseGate new asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testSelectNAsDsp [

	self deny: PhSelectN new asDsp isNull 
]
