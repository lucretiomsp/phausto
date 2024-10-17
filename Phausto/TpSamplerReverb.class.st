"
I am a (Multi) Sample Player. Load a folder containing only .wav files with pathToFolder. Select the file number with the index: parameter (an Integer bewteen 0 and 255).
All sample files int he folder must have the same number of channels (i.e. all must be moro or stereo).

I can be chromatically played using MIDI NOte Numbers, where 60 plays at my defualt speed.

PhSampler (at the moment) is always mono even if files are stereo. You need to send it the stereo message to make it stereo. 
"
Class {
	#name : 'TpSamplerReverb',
	#superclass : 'TpSynth',
	#instVars : [
		'pathToFile',
		'pathToFolder',
		'numChannels',
		'index',
		'readIndex',
		'debugPath',
		'attachedBox'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
TpSamplerReverb >> asBox [

	| allFiles allFilePaths allFilesPathsWithoutLastColumn fileNames filesURL filePathPrefix filePathSuffix reader sp output sampler effect |
	allFiles := pathToFolder asFileReference allChildren.

	fileNames := (2 to: allFiles size) collect: [ :i |
		             (allFiles at: i) asAbsolute pathString
			             surroundedByQuotes ].
	fileNames sort.
	fileNames do: [ :f | f traceCr ].
	allFilePaths := ''.
	fileNames do: [ :i | allFilePaths := allFilePaths , i , ';' ].
	filePathPrefix := '"' , self name, '[url:{'.
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
	effect := GreyHoleDW new dryWet: (PhHSlider new
			           label: self label , 'Effect'
			           init: 0.1
			           min: 0
			           max: 1
			           step: 0.001).
	^ ((sampler asBox * self level )=> effect ) asBox
]

{ #category : 'accessing' }
TpSamplerReverb >> attachedBox [

	^ attachedBox
]

{ #category : 'accessing' }
TpSamplerReverb >> attachedBox: anObject [

	attachedBox := anObject
]

{ #category : 'accessing' }
TpSamplerReverb >> debugPath [

	^ debugPath
]

{ #category : 'accessing' }
TpSamplerReverb >> debugPath: anObject [

	debugPath := anObject
]

{ #category : 'accessing' }
TpSamplerReverb >> index [

	^ index ifNil: [ index := (PhHSlider new
			 label: self name , 'Index'
			 init: 0
			 min: 0
			 max: 16
			 step: 1). ]
]

{ #category : 'accessing' }
TpSamplerReverb >> index: aSampleIndex [

	index := aSampleIndex asBox
]

{ #category : 'initialization' }
TpSamplerReverb >> initialize [

	super initialize.
	self pathToFolder:
		FileLocator documents asAbsolute pathString , '/MoofLodSamples'.


]

{ #category : 'accessing' }
TpSamplerReverb >> name [

	^ name
]

{ #category : 'accessing' }
TpSamplerReverb >> name: aString [

	name := aString
]

{ #category : 'accessing' }
TpSamplerReverb >> numChannels [

	^ numChannels
]

{ #category : 'accessing' }
TpSamplerReverb >> numChannels: aNumOfChannels [

	numChannels := aNumOfChannels asBox
]

{ #category : 'accessing' }
TpSamplerReverb >> pathToFile [

	^ pathToFile
]

{ #category : 'accessing' }
TpSamplerReverb >> pathToFile: aString [

	pathToFile := aString 
]

{ #category : 'accessing' }
TpSamplerReverb >> pathToFolder [

	^ pathToFolder 
]

{ #category : 'accessing' }
TpSamplerReverb >> pathToFolder: aString [

	pathToFolder := aString
]

{ #category : 'accessing' }
TpSamplerReverb >> pitch [ 

	^ pitch ifNil: [ pitch :=  (PhHSlider new
			 label: self name , 'Note'
			 init: 261.625
			 min: 10
			 max: 4000
			 step: 0.1) ]
]

{ #category : 'as yet unclassified' }
TpSamplerReverb >> printOn: aStream [

"check what was the problem of this method in the superclass"
	^ aStream << 'I am the Tp Sampler'
]

{ #category : 'accessing' }
TpSamplerReverb >> readIndex [

	^ readIndex
]

{ #category : 'accessing' }
TpSamplerReverb >> readIndex: aReadIndex [

	readIndex := aReadIndex asBox
]
