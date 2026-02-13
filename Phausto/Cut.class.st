"
Use the Cut object to cut a signal (stop it!) 
"
Class {
	#name : 'Cut',
	#superclass : 'PhBox',
	#category : 'Phausto-Boxes',
	#package : 'Phausto',
	#tag : 'Boxes'
}

{ #category : 'arithmetic' }
Cut >> , anotherCutOrUG [

self asBox , anotherCutOrUG asBox

"parallelComposition of Cuts with other Objects"
]

{ #category : 'converting' }
Cut >> asBox [

	^ BoxAPI uniqueInstance boxCut
]

{ #category : 'connecting' }
Cut >> patchedWith: aPhBox [

aPhBox connectTo: self
]
