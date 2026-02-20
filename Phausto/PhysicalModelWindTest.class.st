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
PhysicalModelWindTest >> testPhBrassUIasDsp [

	self deny: PhBrassUI new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhClarinetUIasDsp [

	self deny: PhClarinetUI new stereo asDsp isNull
]

{ #category : 'tests' }
PhysicalModelWindTest >> testPhReedTableasDsp [

	self deny: PhReedTable new stereo asDsp isNull
]
