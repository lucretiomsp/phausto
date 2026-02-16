Class {
	#name : 'BoxAPITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BoxAPITest >> testCreateAndDestroyLibContext [

	BoxAPI uniqueInstance createLibContext.
	self deny: PhBox libContext not.
	BoxAPI uniqueInstance destroyLibContext.
	self deny: PhBox libContext 
]

{ #category : 'tests' }
BoxAPITest >> testReadOnlyTable [

	| n table index box |
	n := 4 asBox.
	table := #( -1 0 0.5 1 ) asPhZeroList asBox.
	index := 1 asBox.

	box := BoxAPI uniqueInstance
		       boxReadOnlyTable: n
		       init: table
		       index: index.

	self deny: box  isNull
]
