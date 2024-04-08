Class {
	#name : #Cut,
	#superclass : #Box,
	#category : #'Phaust-BoxAPI-Boxes'
}

{ #category : #converting }
Cut >> asBox [

	^ BoxAPI uniqueInstance boxCut
]
