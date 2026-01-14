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

	self deny: PhChain new asDsp isNull.
	

]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testChainWithInputsAsDsp [

   | inputs |
inputs := 0 asBox , 0 asBox , 0 asBox .
	self deny: PhBasicBlock new asDsp isNull
]
