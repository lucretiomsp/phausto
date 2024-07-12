Class {
	#name : 'PrimitvesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PrimitvesTest >> testSec2Samples [

	self assert: Select2  new asDsp isNull equals: false
]
