Class {
	#name : 'PhysicalModelStringTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelStringTest >> testPhNylontringAsDsp [

	self deny: PhNylonString new asDsp isNull.
	

]
