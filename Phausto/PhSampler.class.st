"
I am a (Multi) Sample Player. Load a folder containing only .wav files with pathToFolder. Select the file number with the index: parameter (an Integer bewteen 0 and 255).
All sample files int he folder must have the same number of channels (i.e. all must be moro or stereo).

I can be chromatically played using MIDI NOte Numbers, where 60 plays at my defualt speed.

PhSampler (at the moment) is always mono even if files are stereo. You need to send it the stereo message to make it stereo. 
"
Class {
	#name : #PhSampler,
	#superclass : #TpSynth,
	#instVars : [
		'pathToFile',
		'pathToFolder',
		'numChannels',
		'index',
		'readIndex',
		'debugPath',
		'attachedBox'
	],
	#category : #'Phausto-TurboPhausto'
}

{ #category : #converting }
PhSampler >> asBox [

	| allFiles allFilePaths allFilesPathsWithoutLastColumn fileNames filesURL filePathPrefix filePathSuffix reader sp output sampler |
	allFiles := pathToFolder asFileReference allChildren.

	fileNames := (2 to: allFiles size) collect: [ :i |
		             (allFiles at: i) asAbsolute pathString
			             surroundedByQuotes ].

	allFilePaths := ''.
	fileNames do: [ :i | allFilePaths := allFilePaths , i , ';' ].
	filePathPrefix := '"son[url:{'.
	filePathSuffix := '}]"'.
	allFilesPathsWithoutLastColumn := allFilePaths
		                                  copyFrom: 1
		                                  to: allFilePaths size - 1.
	filesURL := filePathPrefix , allFilesPathsWithoutLastColumn
	            , filePathSuffix.



	reader := PhReaderWithSpeed new
		          trigger: self gate;
		          speed: self pitch / 261.625 asBox.
	sp := BoxAPI uniqueInstance
		      boxSoundFile: filesURL
		      numChannels: 2 asBox
		      part: self index asBox
		      readIndex: reader asBox.

	output := Cut new asBox , Cut new asBox , Cut new asBox
	          , Wire new asBox.
	sampler := sp connectTo: output asBox.
	^ sampler asBox
]

{ #category : #accessing }
PhSampler >> attachedBox [

	^ attachedBox
]

{ #category : #accessing }
PhSampler >> attachedBox: anObject [

	attachedBox := anObject
]

{ #category : #accessing }
PhSampler >> debugPath [

	^ debugPath
]

{ #category : #accessing }
PhSampler >> debugPath: anObject [

	debugPath := anObject
]

{ #category : #accessing }
PhSampler >> index [

	^ index
]

{ #category : #accessing }
PhSampler >> index: aSampleIndex [

	index := aSampleIndex asBox
]

{ #category : #initialization }
PhSampler >> initialize [

	super initialize.
	self pathToFolder:
		FileLocator documents asAbsolute pathString , '/MoofLodSamples'.
	self index: (PhHSlider new
			 label: self name , 'Index'
			 init: 0
			 min: 0
			 max: 16
			 step: 1).
	self pitch: (PhHSlider new
			 label: self name , 'Note'
			 init: 261.625
			 min: 10
			 max: 4000
			 step: 0.1)
]

{ #category : #accessing }
PhSampler >> name [

	^ name
]

{ #category : #accessing }
PhSampler >> name: aString [

	name := aString
]

{ #category : #accessing }
PhSampler >> numChannels [

	^ numChannels
]

{ #category : #accessing }
PhSampler >> numChannels: aNumOfChannels [

	numChannels := aNumOfChannels asBox
]

{ #category : #accessing }
PhSampler >> pathToFile [

	^ pathToFile
]

{ #category : #accessing }
PhSampler >> pathToFile: aString [

	pathToFile := aString 
]

{ #category : #accessing }
PhSampler >> pathToFolder [

	^ pathToFolder 
]

{ #category : #accessing }
PhSampler >> pathToFolder: aString [

	pathToFolder := aString
]

{ #category : #accessing }
PhSampler >> readIndex [

	^ readIndex
]

{ #category : #accessing }
PhSampler >> readIndex: aReadIndex [

	readIndex := aReadIndex asBox
]
