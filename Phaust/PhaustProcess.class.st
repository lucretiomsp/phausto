Class {
	#name : #PhaustProcess,
	#superclass : #Object,
	#category : 'Phaust-Uncategorized'
}

{ #category : #'instance creation' }
PhaustProcess class >> new: aPhaustUnit [

^ 'process = ' , aPhaustUnit phaustString   , ';'
]
