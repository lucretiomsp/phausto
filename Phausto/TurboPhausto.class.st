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

{ #category : 'testing' }
TurboPhausto class >> hasTurboSamplesFolder [

	^ self turboSamplesFolder asFileReference exists
]

{ #category : 'as yet unclassified' }
TurboPhausto class >> loadAllTurboSamplers [

	| size  allSamplers subDir allLabels|
	subDir := self turboSamplesFolder asFileReference children.
	size := subDir size.
	allSamplers := subDir collect: [ :i | TpSampler new pathToFolder: i pathString ].
	allLabels :=  subDir collect: [ :i | (i pathString findBetweenSubstrings: '/' ) last asString].
	1 to: size do: [ :i| (allSamplers at: i) gate: ((allLabels at: i) , 'Gate' ) asSymbol; pitch: ((allLabels at: i) , 'Note' ) asSymbol; uLevel: ((allLabels at: i) , 'Note' ) asSymbol  ].

	^ allSamplers
]

{ #category : 'accessing' }
TurboPhausto class >> turboSamplesFolder [

^ (FileLocator documents asAbsolute pathString
	                 , '/TurboSamples')
]
