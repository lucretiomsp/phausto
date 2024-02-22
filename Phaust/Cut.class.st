Class {
	#name : #Cut,
	#superclass : #Box,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
Cut >> asBox [

	^ BoxAPI uniqueInstance boxCut
]
