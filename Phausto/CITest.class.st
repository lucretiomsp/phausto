Class {
	#name : 'CITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CITest >> setUp [

	{
		(FFIMacLibraryFinder findLibrary: 'librariesBundle/libfaust.2.dylib').
		(FFIMacLibraryFinder findLibrary: 'librariesBundle/libdynamic-engine.dylib') 
	} traceCr
]

{ #category : 'tests' }
CITest >> tearDown [

	BoxAPI uniqueInstance destroyLibContext
]

{ #category : 'tests' }
CITest >> testDsp [

	self deny: 1 asBox asDsp isNull
]
