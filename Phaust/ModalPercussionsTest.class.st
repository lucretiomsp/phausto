Class {
	#name : #ModalPercussionsTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
ModalPercussionsTest >> testDjembeAsDsp [

self assert: Djembe new asDsp isNull equals: false
]

{ #category : #tests }
ModalPercussionsTest >> testStrikeModelAsDsp [

	self assert: StrikeModel new asDsp isNull equals: false
]
