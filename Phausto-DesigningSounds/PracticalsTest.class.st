Class {
	#name : 'PracticalsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-DesigningSounds-Test',
	#package : 'Phausto-DesigningSounds',
	#tag : 'Test'
}

{ #category : 'tests' }
PracticalsTest >> testDsPoliceAsDsp [

self deny: DsPolice new asBox  asDsp isNull
]
