Class {
	#name : 'ExtensionsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
ExtensionsTest >> testArrayAsChainOfUGens [

	| array |
	array := { SquareOsc new . FreeverbMono new . ResonBp new }.

	self deny: array asChainOfUGen asDsp isNull
]
