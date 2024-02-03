"
Superclass for all sample players
"
Class {
	#name : #SamplePlayers,
	#superclass : #CTree,
	#instVars : [
		'pathToFile',
		'numChannels',
		'part',
		'readIndex'
	],
	#category : #'Phaust-ToolKit'
}

{ #category : #initialization }
SamplePlayers >> initialize [

	super initialize.
	part := 0.
	numChannels := 1. "by default sample players are mono"
	pathToFile := ''.
	readIndex := 0
]

{ #category : #accessing }
SamplePlayers >> numChannels [

	^ numChannels
]

{ #category : #accessing }
SamplePlayers >> numChannels: anObject [

	numChannels := anObject
]

{ #category : #accessing }
SamplePlayers >> part [

	^ part
]

{ #category : #accessing }
SamplePlayers >> part: anObject [

	part := anObject
]

{ #category : #accessing }
SamplePlayers >> pathToFile [

	^ pathToFile
]

{ #category : #accessing }
SamplePlayers >> pathToFile: anObject [

	pathToFile := anObject
]

{ #category : #accessing }
SamplePlayers >> readIndex [

	^ readIndex
]

{ #category : #accessing }
SamplePlayers >> readIndex: anObject [

	readIndex := anObject
]
