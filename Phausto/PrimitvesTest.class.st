Class {
	#name : #PrimitvesTest,
	#superclass : #TestCase,
	#category : #'Phausto-Tests'
}

{ #category : #tests }
PrimitvesTest >> testSec2Samples [

	self assert: Select2  new asDsp isNull equals: false
]
