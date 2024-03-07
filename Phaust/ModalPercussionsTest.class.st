Class {
	#name : #ModalPercussionsTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
ModalPercussionsTest >> testDjembeAsDsp [

self assert: Djembe new asDsp isNull equals: false
]
