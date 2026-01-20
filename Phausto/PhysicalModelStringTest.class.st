Class {
	#name : 'PhysicalModelStringTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelStringTest >> testPhNylonStringAsDsp [

	self deny: PhNylonString new asDsp isNull.
	

]

{ #category : 'tests' }
PhysicalModelStringTest >> testPhSteelStringAsDsp [

	self deny: PhSteelString new asDsp isNull
]
