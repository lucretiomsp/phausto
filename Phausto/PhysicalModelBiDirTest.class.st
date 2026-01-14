Class {
	#name : 'PhysicalModelBiDirTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelBiDirTest >> testBasicBlockAsDsp [ 

self deny: PhBasicBlock new asDsp isNull.
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testChainAsDsp [

	self deny: PhBasicBlock new asDsp isNull
]
