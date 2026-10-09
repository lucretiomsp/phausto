Class {
	#name : 'TpSamplerTest',
	#superclass : 'TestCase',
	#instVars : [
		'samplesRoot'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
TpSamplerTest >> entriesOf: aSampler [
	"quoted paths between '[url:{' and '}]'"

	| inner |
	inner := (aSampler filesURL copyAfter: ${) copyUpToLast: $}.
	^ (inner substrings: ';') asArray
]

{ #category : 'running' }
TpSamplerTest >> sampleFolders [
	^ samplesRoot directories
]

{ #category : 'running' }
TpSamplerTest >> samplerFor: aFolder [
	^ TpSampler new
		  pathToFolder: aFolder pathString;
		  yourself
]

{ #category : 'running' }
TpSamplerTest >> setUp [
	super setUp.
	samplesRoot := FileLocator imageDirectory asFileReference / 'TurboSamples'.
	samplesRoot exists ifFalse: [
		self skip: 'No TurboSamples folder next to the image' ]
]

{ #category : 'running' }
TpSamplerTest >> supportedExtensions [
	^ #( 'wav' 'aif' 'aiff' )
]

{ #category : 'running' }
TpSamplerTest >> supportedFilesIn: aFolder [
	^ aFolder allChildren select: [ :f |
		  f isFile and: [
			  f isHidden not and: [
				  self supportedExtensions includes: f extension asLowercase ] ] ]
]

{ #category : 'tests' }
TpSamplerTest >> testFoldersWithoutSupportedFilesSignalError [
	(self sampleFolders select: [ :d | (self supportedFilesIn: d) isEmpty ])
		do: [ :folder |
			self should: [ (self samplerFor: folder) createMultiFilesURL ] raise: Error ]
]

{ #category : 'tests' }
TpSamplerTest >> testTurboSamplesHasUsableFolders [
	self deny: (self sampleFolders allSatisfy: [ :d |
			 (self supportedFilesIn: d) isEmpty ])
]
