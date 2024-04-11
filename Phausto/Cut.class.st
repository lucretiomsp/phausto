Class {
	#name : #Cut,
	#superclass : #Box,
	#category : #'Phausto-BoxAPI-Boxes'
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
