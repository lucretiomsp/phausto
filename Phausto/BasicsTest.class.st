Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> testResetCtrAsDsp [

	self assert: ResetCtr new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSelectNAsDsp [

	self assert: SelectN new asDsp isNull equals: false
]
