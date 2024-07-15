Class {
	#name : #PhWavReader,
	#superclass : #Object,
	#instVars : [
		'isBigEndian',
		'numChannels',
		'data',
		'numSamples',
		'sourceFile'
	],
	#category : #PhAudioWavReader
}

{ #category : #accessing }
PhWavReader >> data [

	^ data
]

{ #category : #accessing }
PhWavReader >> data: anObject [

	data := anObject
]

{ #category : #accessing }
PhWavReader >> isBigEndian [

	^ isBigEndian
]

{ #category : #accessing }
PhWavReader >> isBigEndian: aBoolean [

	isBigEndian := aBoolean
]

{ #category : #accessing }
PhWavReader >> numChannels [

	^ numChannels
]

{ #category : #accessing }
PhWavReader >> numChannels: anInteger [

	numChannels := anInteger
]

{ #category : #accessing }
PhWavReader >> numSamples [

	^ numSamples
]

{ #category : #accessing }
PhWavReader >> numSamples: anInteger [

	numSamples := anInteger
]

{ #category : #'as yet unclassified' }
PhWavReader >> sourceFile [

^ sourceFile 
]

{ #category : #'as yet unclassified' }
PhWavReader >> sourceFileName: aString [

sourceFile := aString asFileReference 
]
