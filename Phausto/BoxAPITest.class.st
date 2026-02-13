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
	self deny: PhBox libContext not
]
