Class {
	#name : 'ToolkitTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
ToolkitTest >> testPHSelectNAsDsp [

	self
		assert: (PhSelectN new: #( 3 2 1 )) asDsp isNull
		equals: false.
		
		self
		assert: (PhSelectN new list:  #( 3 2 1 )) asDsp isNull
		equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPhCounterAsDsp [

	self assert: PhCounter new asDsp isNull equals: false
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
ToolkitTest >> testPhSubBeatAsDsp [

	self assert: PhSubBeat new asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPulseGateAsDsp [

self assert: PulseGate new asDsp isNull equals: false
]
