"
I am a **(Multi)Sample Player**. Load a folder containing only _.wav_ or _.aiff_ files with 
```language=pharo
self new pathToFolder: aString. 
```
Select the file number with the _index_ parameter (an Integer bewteen 0 and 255). If index> folder size, last available sound will be reproduced
All sample files int he folder must have the same number of channels (i.e. all must be moro or stereo).

I can be chromatically played using MIDI NOte Numbers, where 60 plays at my defualt speed.

I am always mono even if files are stereo. You need to send it the `stereo` message to make it stereo. 
"
Class {
	#name : 'PhLoops',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pathToFile',
		'pathToFolder',
		'numChannels',
		'index',
		'readIndex',
		'debugPath',
		'attachedBox',
		'filesURL',
		'fileNamesSorted',
		'sampleNamesSorted'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'accessing' }
PhLoops >> attachedBox [

	^ attachedBox
]

{ #category : 'accessing' }
PhLoops >> attachedBox: anObject [

	attachedBox := anObject
]

{ #category : 'changing' }
PhLoops >> changeParamsPrefix [

	| prefix |
	prefix := self name.

	self gate: ((WriteStream on: String new)
			 nextPutAll: prefix;
			 nextPutAll: 'Trigger';
			 yourself) contents asSymbol.

	self pitch: ((WriteStream on: String new)
			 nextPutAll: prefix;
			 nextPutAll: 'Freq') yourself asSymbol.
	self index: ((WriteStream on: String new)
			 nextPutAll: prefix;
			 nextPutAll: 'Index') yourself asSymbol.
	self uLevel: ((WriteStream on: String new)
			 nextPutAll: prefix;
			 nextPutAll: 'uLevel') yourself asSymbol
]

{ #category : 'utilities' }
PhLoops >> createMultiFilesURL [

	| allFiles audioFiles unsortedfileNames allFilePaths filePathPrefix filePathSuffix allFilesPathsWithoutLastColumn |
	allFiles := pathToFolder asFileReference allChildren reject: [ :i |
		            i isHidden ].
	"first we select only valid audio files"
	audioFiles := allFiles select: [ :f | f pathString isAudioFilePath ].
	unsortedfileNames := (2 to: audioFiles size + 1) collect: [ :i |
		                     (allFiles at: i) asAbsolute pathString
			                     surroundedByQuotes ].
	
	fileNamesSorted := unsortedfileNames sort.

	fileNamesSorted do: [ :f | f traceCr ].

	allFilePaths := ''.
	fileNamesSorted do: [ :i |
		allFilePaths := (allFilePaths copyReplaceAll: '\' with: '/') , i
		                , ';' ].
	filePathPrefix := '' , self label , '[url:{'.
	filePathSuffix := '}]'.
	allFilesPathsWithoutLastColumn := allFilePaths
		                                  copyFrom: 1
		                                  to: allFilePaths size - 1.
	filesURL := filePathPrefix , allFilesPathsWithoutLastColumn
	            , filePathSuffix
]

{ #category : 'initialization' }
PhLoops >> createSingleFilesURL [

	| filePathPrefix filePathSuffix filePath |
	filePathPrefix := '' , self label , '[url:'.
	filePathSuffix := ']'.
	"fix WIndows paths"
	filePath := self pathToFile copyReplaceAll: '\' with: '/'.
	filesURL := filePathPrefix , filePath , filePathSuffix
]

{ #category : 'accessing' }
PhLoops >> debugPath [

	^ debugPath
]

{ #category : 'accessing' }
PhLoops >> debugPath: anObject [

	debugPath := anObject
]

{ #category : 'accessing' }
PhLoops >> fileNamesSorted [

	^ fileNamesSorted
]

{ #category : 'accessing' }
PhLoops >> index [

	^ index 
]

{ #category : 'initialization' }
PhLoops >> initialize [

	super initialize.

]

{ #category : 'accessing' }
PhLoops >> numChannels [

	^ numChannels
]

{ #category : 'accessing' }
PhLoops >> numChannels: aNumOfChannels [

	numChannels := aNumOfChannels 
]

{ #category : 'accessing' }
PhLoops >> numberOfSamples [

^ self pathToFolder asFileReference children size
]

{ #category : 'accessing' }
PhLoops >> pathToFile [

	^ pathToFile
]

{ #category : 'accessing' }
PhLoops >> pathToFile: aString [

	pathToFile := aString.
	self createSingleFilesURL .
]

{ #category : 'accessing' }
PhLoops >> pathToFolder [

	^ pathToFolder 
]

{ #category : 'accessing' }
PhLoops >> pathToFolder: aString [

	pathToFolder := aString.
	self createMultiFilesURL.
	"we set the maximum value for index as the number of samples in the folder"
	self index max: self numberOfSamples.
	sampleNamesSorted := self fileNamesSorted collect: [ :i |
		               (i  afterLastSlash findBetweenSubstrings: '.') first ]
]

{ #category : 'accessing' }
PhLoops >> pitch [

	^ pitch "ifNil: [
			  pitch := PhHSlider new
				           label: self label , 'Note'
				           init: 261.625
				           min: 10
				           max: 4000
				           step: 0.1 ]"
]

{ #category : 'accessing' }
PhLoops >> readIndex [

	^ readIndex
]

{ #category : 'accessing' }
PhLoops >> readIndex: aReadIndex [

	readIndex := aReadIndex asBox
]

{ #category : 'accessing' }
PhLoops >> sampleNamesSorted [

	
	^ sampleNamesSorted
]
