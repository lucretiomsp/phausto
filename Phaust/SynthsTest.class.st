Class {
	#name : #SynthsTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
SynthsTest >> testClapAsBox [

self assert: Clap new asDsp isNull equals: false
]
