Class {
	#name : #Cut,
	#superclass : #Box,
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #arithmetic }
Cut >> , anotherCutOrUG [

self asBox , anotherCutOrUG asBox

"parallelComposition of Cuts with other Objects"
]

{ #category : #converting }
Cut >> asBox [

	^ BoxAPI uniqueInstance boxCut
]
