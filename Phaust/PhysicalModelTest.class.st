Class {
	#name : #PhysicalModelTest,
	#superclass : #TestCase,
	#category : #'Phaust-Tests'
}

{ #category : #tests }
PhysicalModelTest >> testDjembeAsDsp [

self assert: Djembe  new asDsp isNull equals: false
]

{ #category : #tests }
PhysicalModelTest >> testFrenchBellAsDsp [

self assert: FrenchBell  new asDsp isNull equals: false
]

{ #category : #tests }
PhysicalModelTest >> testMarimbaAsDsp [

	self assert: Marimba new asDsp isNull equals: false
]

{ #category : #tests }
PhysicalModelTest >> testStrikeModelAsDsp [

	self assert: StrikeModel new asDsp isNull equals: false
]

{ #category : #tests }
PhysicalModelTest >> testViolinModelAsDsp [

self assert: ViolinModel  new asDsp isNull equals: false
]
