Class {
	#name : 'QuantizersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
QuantizersTest >> testPhQuantizeAsDsp [

self deny: PhQuantize  new asDsp isNull.
]
