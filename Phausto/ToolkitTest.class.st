Class {
	#name : 'ToolkitTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
ToolkitTest >> testPHSelectNAsDsp [

	self assert: (PhSelectN new list: #( 1 2 3 )) asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPhListAsDsp [

   | list |
 list := PhList new addAll: #( 1 2 3).
	self assert: list asDsp isNull equals: false
]

{ #category : 'tests' }
ToolkitTest >> testPulseGateAsDsp [

self assert: PulseGate new asDsp isNull equals: false
]
