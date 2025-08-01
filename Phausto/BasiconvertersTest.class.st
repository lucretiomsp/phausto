Class {
	#name : 'BasiconvertersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasiconvertersTest >> testDb2Linear [

	self deny: PhDb2Linear new asDsp isNull
]

{ #category : 'tests' }
BasiconvertersTest >> testLinear2dB [ 

	self deny: PhLinear2Db new asDsp isNull
]

{ #category : 'tests' }
BasiconvertersTest >> testSamp2Sec [

self deny: PhSamp2Sec new asDsp isNull.
]
