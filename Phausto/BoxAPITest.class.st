Class {
	#name : #BoxAPITest,
	#superclass : #TestCase,
	#category : #'Phausto-Tests'
}

{ #category : #tests }
BoxAPITest >> testCreateAndDestroyLibContext [

BoxAPI uniqueInstance createLibContext.
self assert: Box libContext equals: true.
BoxAPI uniqueInstance destroyLibContext.
self assert: Box libContext equals: false.

]
