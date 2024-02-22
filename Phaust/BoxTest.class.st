Class {
	#name : #BoxTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
BoxTest >> testLibContextIsNilAtStartup [

self assert: Box libContext equals: nil
]
