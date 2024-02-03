"
#Basic mono sample player
## Usage

```Smalltalk
""Create an instance""
sp := SamplePlayer new.
""Specify a path to an audio files""
sp path: 'mySamples/exampleDrumSample.wav'.
""Give it a unique name if you want to use more than one""
sp name: 'drum'.
""Compile it  as a DSP, initialize it and start it""
myDsp := sp asDsp.
""Now it can be triggered with:""
myDsp trig: 'drumGate'.
```
### DONT FORGET TO APPEND THE SUFFIX GATE TO YOUR SAMPLE NAME TO TRIG IT




"
Class {
	#name : #SamplePlayer,
	#superclass : #CTree,
	#instVars : [
		'pathToFile',
		'numChannels',
		'part',
		'readIndex',
		'name',
		'debugPath'
	],
	#category : #'Phaust-ToolKit'
}

{ #category : #converting }
SamplePlayer >> asBox [

	| code intermediateBox |
	code := 'import("stdfaust.lib");
rst = button("' , self name , 'Gate' , '");
resetter = _ , 0 : select2(rst);
reader = resetter~+(1) ;
process = 0,reader:soundfile("son[url:{''' , self pathToFile
	        , '''}]",2): ! , ! , _ ,_ ;'.

	debugPath := 'process = 0,reader:soundfile("son[url:{'' '
	             , self pathToFile , '''}]",2): ! , ! , _ ,_ ;'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: code
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.

	^ intermediateBox
]

{ #category : #initialization }
SamplePlayer >> initialize [

	super initialize.
	part := 0.
	numChannels := 1. "by default sample players are mono"
	pathToFile := ''.
	readIndex := 0.
	name := 'sampler'
]

{ #category : #accessing }
SamplePlayer >> name [

	^ name
]

{ #category : #accessing }
SamplePlayer >> name: anObject [

	name := anObject
]

{ #category : #accessing }
SamplePlayer >> numChannels [

	^ numChannels
]

{ #category : #accessing }
SamplePlayer >> numChannels: anObject [

	numChannels := anObject
]

{ #category : #accessing }
SamplePlayer >> part [

	^ part
]

{ #category : #accessing }
SamplePlayer >> part: anObject [

	part := anObject
]

{ #category : #accessing }
SamplePlayer >> pathToFile [

	^ pathToFile
]

{ #category : #accessing }
SamplePlayer >> pathToFile: anObject [

	pathToFile := anObject
]

{ #category : #accessing }
SamplePlayer >> readIndex [

	^ readIndex
]

{ #category : #accessing }
SamplePlayer >> readIndex: anObject [

	readIndex := anObject
]
