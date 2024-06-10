Class {
	#name : #PhSampler,
	#superclass : #TpSynth,
	#instVars : [
		'pathToFile',
		'numChannels',
		'part',
		'readIndex',
		'name',
		'debugPath',
		'attachedBox'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
PhSampler >> asBox [

	| filePath reader sp output sampler |
	filePath := '"son[url:{
		''/Users/domenicocipriani/MyStuff/samples/divine909/909\ HH\ Original.wav'';
	   ''/Users/domenicocipriani/MyStuff/samples/divine909/909\ OH\ Original.wav'';
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/CowBellZX.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/CowBellZX.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/Cabriole.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/Flipper.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/Rim98.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/ClapGolf.wav'' ;
		''/Users/domenicocipriani/MyStuff/samples/dcm8-vxxy/originals-dcm8/Ducker.wav'' 
		}]"'.
	reader := PhReaderWithSpeed new trigger: self gate.
	sp := BoxAPI uniqueInstance
		      boxSoundFile: filePath
		      numChannels: 2 asBox
		      part: self part asBox
		      readIndex: reader asBox.

	output := Cut new asBox , Cut new asBox , Wire new asBox
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

{ #category : #initialization }
PhSampler >> initialize [

	super initialize.
	self part: 0.
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
PhSampler >> part [

	^ part
]

{ #category : #accessing }
PhSampler >> part: aPartNumber [

	part := aPartNumber asBox
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
PhSampler >> readIndex [

	^ readIndex
]

{ #category : #accessing }
PhSampler >> readIndex: aReadIndex [

	readIndex := aReadIndex asBox
]
