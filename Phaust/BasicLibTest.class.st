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
BasicLibTest >> testSamp2Sec [


self assert: Samp2Sec new asDsp isNull equals: false
]
