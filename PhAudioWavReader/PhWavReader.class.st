Class {
	#name : #PhWavReader,
	#superclass : #Object,
	#instVars : [
		'isBigEndian',
		'numChannels',
		'data',
		'numSamples',
		'sourceFile',
		'isWavFile',
		'fileStream'
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
PhWavReader >> isWavFile [

^ ((fileStream position: 8) next: 4) asString = 'WAVE'
	
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

	sourceFile := File named: aString asFileReference fullName.
	fileStream := sourceFile readStream
]
