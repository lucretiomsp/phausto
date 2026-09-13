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
	#name : 'TpSamplerPLUS',
	#superclass : 'TpSynth',
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
		'sampleNamesSorted',
		'lengthInSamples',
		'sampleRate'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
TpSamplerPLUS >> asBox [

	| reader sp output sampler partNumber |
	partNumber := self index asBox min: self numberOfSamples asBox.

	reader := PhReaderWithSpeed new
		          trigger: self trigger asBox;
		          speed: self pitch asBox / 261.625 asBox.
	sp := BoxAPI uniqueInstance
		      boxSoundFile: filesURL
		      numChannels: self numChannels asBox
		      part: partNumber
		      readIndex: reader asBox.

	output := (BoxAPI  uniqueInstance boxAttach: Wire new asBox  with: lengthInSamples asBox )
	          , (BoxAPI  uniqueInstance boxAttach: Wire new asBox  with: sampleRate asBox )
	          , Cut new asBox , Wire new asBox.
	sampler := sp connectTo: output asBox.

	^ (sampler asBox * self uLevel) asBox
]

{ #category : 'accessing' }
TpSamplerPLUS >> attachedBox [

	^ attachedBox
]

{ #category : 'accessing' }
TpSamplerPLUS >> attachedBox: anObject [

	attachedBox := anObject
]

{ #category : 'changing' }
TpSamplerPLUS >> changeParamsPrefix [

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
TpSamplerPLUS >> createMultiFilesURL [

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
TpSamplerPLUS >> createSingleFilesURL [

	| filePathPrefix filePathSuffix filePath |
	filePathPrefix := '' , self label , '[url:'.
	filePathSuffix := ']'.
	"fix WIndows paths"
	filePath := self pathToFile copyReplaceAll: '\' with: '/'.
	filesURL := filePathPrefix , filePath , filePathSuffix
]

{ #category : 'accessing' }
TpSamplerPLUS >> debugPath [

	^ debugPath
]

{ #category : 'accessing' }
TpSamplerPLUS >> debugPath: anObject [

	debugPath := anObject
]

{ #category : 'accessing' }
TpSamplerPLUS >> fileNamesSorted [

	^ fileNamesSorted
]

{ #category : 'accessing' }
TpSamplerPLUS >> index [

	^ index 
]

{ #category : 'initialization' }
TpSamplerPLUS >> initialize [

	super initialize.
	"Stereo by default"
	numChannels := 2.
	self pitch: 261.625.
	index := PhHSlider new
		         label: self coypuLabel , 'Index'
		         init: 0
		         min: 0
		         max: 16
		         step: 1.
	self pathToFolder: FileLocator imageDirectory asAbsolute pathString
		, '/TurboSamples/bleep'.
	lengthInSamples := PhHBarGraph new input: Wire new asBox ;  label: self label , 'LNS'.
	sampleRate := PhHBarGraph new input: Wire new asBox ; label: self label , 'SR'
]

{ #category : 'accessing' }
TpSamplerPLUS >> name [

	^ name
]

{ #category : 'accessing' }
TpSamplerPLUS >> name: aString [

	name := aString.

]

{ #category : 'accessing' }
TpSamplerPLUS >> numChannels [

	^ numChannels
]

{ #category : 'accessing' }
TpSamplerPLUS >> numChannels: aNumOfChannels [

	numChannels := aNumOfChannels 
]

{ #category : 'accessing' }
TpSamplerPLUS >> numberOfSamples [

^ self pathToFolder asFileReference children size
]

{ #category : 'accessing' }
TpSamplerPLUS >> pathToFile [

	^ pathToFile
]

{ #category : 'accessing' }
TpSamplerPLUS >> pathToFile: aString [

	pathToFile := aString.
	self createSingleFilesURL .
]

{ #category : 'accessing' }
TpSamplerPLUS >> pathToFolder [

	^ pathToFolder 
]

{ #category : 'accessing' }
TpSamplerPLUS >> pathToFolder: aString [

	pathToFolder := aString.
	self createMultiFilesURL.
	"we set the maximum value for index as the number of samples in the folder"
	self index max: self numberOfSamples.
	sampleNamesSorted := self fileNamesSorted collect: [ :i |
		               (i  afterLastSlash findBetweenSubstrings: '.') first ]
]

{ #category : 'accessing' }
TpSamplerPLUS >> pitch [

	^ pitch "ifNil: [
			  pitch := PhHSlider new
				           label: self label , 'Note'
				           init: 261.625
				           min: 10
				           max: 4000
				           step: 0.1 ]"
]

{ #category : 'accessing' }
TpSamplerPLUS >> readIndex [

	^ readIndex
]

{ #category : 'accessing' }
TpSamplerPLUS >> readIndex: aReadIndex [

	readIndex := aReadIndex asBox
]

{ #category : 'accessing' }
TpSamplerPLUS >> sampleNamesSorted [

	
	^ sampleNamesSorted
]
