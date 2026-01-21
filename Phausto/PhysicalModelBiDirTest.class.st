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

{ #category : 'tests' }
PhysicalModelBiDirTest >> testCloseInsAsDsp [

	self deny: CloseIns new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testCloseOutsAsDsp [

	self deny: CloseOuts new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testInLeftRightWaveAsDsp [

	
	self deny: InLeftRightWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testInLeftWaveAsDsp [

	
	self deny: InLeftWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testInRightWaveAsDsp [

	
	self deny: InRightWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testOutLeftRightWaveAsDsp [

	self deny: OutLeftRightWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testOutLeftWaveAsDsp [

	self deny: OutLeftWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testOutRightWaveAsDsp [

	self deny: OutRightWave new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testPhEndChainAsDsp [

	self deny: PhEndChain new asDsp isNull
]

{ #category : 'tests' }
PhysicalModelBiDirTest >> testPhTerminationsDsp [

	self deny: PhTerminations new asDsp isNull
]
