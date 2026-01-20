Class {
	#name : 'RoutesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
RoutesTest >> testCrossnnAsDsp [ 

self deny: PhCrossnn new asDsp isNull
]
