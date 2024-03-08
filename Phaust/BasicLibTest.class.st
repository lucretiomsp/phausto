Class {
	#name : #BasicLibTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
BasicLibTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]

{ #category : #tests }
BasicLibTest >> testSec2Samples [

	self assert: Sec2Samples  new asDsp isNull equals: false
]
