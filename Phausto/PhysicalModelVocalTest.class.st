Class {
	#name : 'PhysicalModelVocalTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
PhysicalModelVocalTest >> testVoiceGenderAsDsp [

	self deny: PhVoiceGender new asDsp isNull 
]
