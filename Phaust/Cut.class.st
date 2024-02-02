Class {
	#name : #Cut,
	#superclass : #CTree,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
Cut >> asBox [

	^ BoxAPI uniqueInstance boxCut
]
