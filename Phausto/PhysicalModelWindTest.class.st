Class {
	#name : 'PhysicalModelWindTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelWindTest >> testPHFluteUIasDsp [

self deny: PhFluteUI new  stereo asDsp isNull.
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhBrassLipsTableasDsp [

	self deny: PhBrassLipsTable new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhBrassModelUIasDsp [

	self deny: PhBrassModelUI new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhBrassUIasDsp [

	self deny: PhBrassUI new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhClarinetModelAsDsp [

	self deny: PhClarinetModel new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhClarinetReedAsDsp [

	self deny: PhClarinetReed new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhClarinetUIasDsp [

	self deny: PhClarinetUI new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhFluteJetTableasDsp [

	self deny: PhReedTable new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhReedTableasDsp [

	self deny: PhFluteJetTable new stereo asDsp isNull
]
