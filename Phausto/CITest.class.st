Class {
	#name : 'CITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CITest >> setUp [

	Smalltalk platform isMacOS ifTrue: [
		{
			BoxAPI uniqueInstance macLibraryName.
			PhaustoDynamicEngine uniqueInstance macLibraryName } traceCr ].

	Smalltalk platform isUnix ifTrue: [
		{
			BoxAPI uniqueInstance unixLibraryName.
			PhaustoDynamicEngine uniqueInstance unixLibraryName } traceCr ].

	Smalltalk platform isWindows ifTrue: [
		{
			BoxAPI uniqueInstance win32LibraryName.
			PhaustoDynamicEngine uniqueInstance win32LibraryName } traceCr ]
]

{ #category : 'tests' }
CITest >> tearDown [

	BoxAPI uniqueInstance destroyLibContext
]

{ #category : 'tests' }
CITest >> testDsp [

	self deny: 1 asBox asDsp isNull
]
