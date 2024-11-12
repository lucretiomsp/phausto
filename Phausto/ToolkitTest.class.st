Class {
	#name : 'ToolkitTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
ToolkitTest >> testPulseGateAsDsp [

self assert: PulseGate new asDsp isNull equals: false
]
