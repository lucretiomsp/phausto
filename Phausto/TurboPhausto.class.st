"
This class is used to load all the instruments of TurboPhausto.
"
Class {
	#name : 'TurboPhausto',
	#superclass : 'Object',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'as yet unclassified' }
TurboPhausto class >> loadAllSamplers [

	| size allSamplers subDir allLabels |
	self samplesFolderExists
		ifTrue: [
			subDir := self turboSamplesFolder asFileReference children select: [:i | i isDirectory].
			size := subDir size.
			allSamplers := subDir collect: [ :i |
				               TpSampler new pathToFolder: i pathString ].
			allLabels := subDir collect: [ :i |
				             (i pathString findBetweenSubstrings: '/') last
					             asString ].
			1 to: size do: [ :i | (allSamplers at: i) name: (allLabels at: i) ].

			^ allSamplers ]
		ifFalse: [
			^ Error new signal:
				  'Please place TurboSamples folder in your Documents Folder' ]
]

{ #category : 'testing' }
TurboPhausto class >> samplesFolderExists [

	^ self turboSamplesFolder asFileReference exists
]

{ #category : 'accessing' }
TurboPhausto class >> turboSamplesFolder [

^ (FileLocator documents asAbsolute pathString
	                 , '/TurboSamples')
]
