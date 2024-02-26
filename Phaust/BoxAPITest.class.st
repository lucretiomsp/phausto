Class {
	#name : #BoxAPITest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
BoxAPITest >> testCreateAndDestroyLibContext [

BoxAPI uniqueInstance createLibContext.
self assert: Box libContext equals: true.
BoxAPI uniqueInstance destroyLibContext.
self assert: Box libContext equals: false.

]
