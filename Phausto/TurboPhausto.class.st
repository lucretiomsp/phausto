"
This class is used to load all the instruments and effect of TurboPhausto.
When we create a new instance of the class, a DSP is created and assigned to a Performance.
TurboPhausto instances understands the messages to play/stop/mute/solo a Performance.
Basi usage:
Here is some code 

```language=Pharo
   TurboPhausto start.
   tp := TurboPhausto new.
   tp bpm: 140.
   16 downbeats to: #snare.
   tp playFor: 8 bars.

```
"
Class {
	#name : 'TurboPhausto',
	#superclass : 'Object',
	#classInstVars : [
		'allSamplers',
		'tpDsp',
		'tpPerf',
		'allSynths'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
TurboPhausto class >> allInstruments [

^ allSamplers , allSynths
]

{ #category : 'accessing' }
TurboPhausto class >> allSamplers [

^ allSamplers
]

{ #category : 'accessing' }
TurboPhausto class >> allSynths [

	^ allSynths 
]

{ #category : 'SuperDirt-List' }
TurboPhausto class >> listOfSamples [ 

self turboSamplesFolder asFileReference inspect.
]

{ #category : 'loading' }
TurboPhausto class >> loadAllSamplers [

"transform all the subfolder of TurboPhausto into TpSamplers and collect themm into an Array"
	| size  subDir allLabels |
	self samplesFolderExists
		ifTrue: [
			subDir := self turboSamplesFolder asFileReference children select: [
				          :i | i isDirectory ].
			size := subDir size.
			allSamplers := subDir collect: [ :i |
				               TpSampler new pathToFolder: i pathString ].
			allLabels := subDir collect: [ :i |
				             (i pathString findBetweenSubstrings: '/') last
					             asString ].
			1 to: size do: [ :i | (allSamplers at: i) label: (allLabels at: i) ].

			^ allSamplers ]
		ifFalse: [
			^ Error new signal:
				  'Please place TurboSamples folder in your Documents Folder' ]
]

{ #category : 'loading' }
TurboPhausto class >> loadAllSynths [
	"load all TurboSynths - kept empty for now"

	allSynths := OrderedCollection new.
	allSynths
		add: (Djembe new
				 label: 'djembe';
				 trigger: #djembeGate;
				 freq: #djembeNote);
		add: (Marimba new
				 label: 'marimba';
				 trigger: #marimbaGate;
				 freq: #marimbaNote);
		add: (Guitar new
				 label: 'guitar';
				 trigger: #guitarGate;
				 freq: #guitarNote);
		add: (SawTrombone new
				 label: 'trombone';
				 freq: #tromboneNote);
		add: (Clap new
				 label: 'syclap';
				 tone: #syclapNote);
		add: (Kick new
				 label: 'sykick';
				 pitch: #sykickNote);
		add: (Hat new
				 label: 'syhat';
				 pitch: #syhatNote);
	"	add: (CombString new
				 label: 'combstring';
				 freq: #combstringNote);"
		add: (DubDub new
				 label: 'dubdub';
				 freq: #dubdubNote)
]

{ #category : 'testing' }
TurboPhausto class >> samplesFolderExists [

	^ self turboSamplesFolder asFileReference exists
]

{ #category : 'accessing' }
TurboPhausto class >> start [
	"load all the Turbo- Samplers, Synths and Effects. initialize and start a dsp and assign it to a Performance"

	self loadAllSamplers.
	self loadAllSynths.
	tpDsp := self allInstruments asSumOfUGen stereo asDsp.
	[[[tpDsp ] value ifNotNil: [ tpDsp init]] value ifNotNil: 
	[tpDsp start]] fork.
	[ 0.11 seconds wait ] fork.
	tpPerf := Performance uniqueInstance forDsp: tpDsp
]

{ #category : 'accessing' }
TurboPhausto class >> tpDsp [

	^ tpDsp.
]

{ #category : 'accessing' }
TurboPhausto class >> tpPerf [

^ tpPerf 
]

{ #category : 'accessing' }
TurboPhausto class >> turboSamplesFolder [

^ (FileLocator documents asAbsolute pathString
	                 , '/TurboSamples')
]

{ #category : 'accessing' }
TurboPhausto >> bpm: aNumber [

	self class tpPerf bpm: aNumber bpm
]

{ #category : 'playing' }
TurboPhausto >> mute: aSymbol [

	self class tpPerf mute: aSymbol 
]

{ #category : 'playing' }
TurboPhausto >> muteAll: anArrayOfSymbols [

	self class tpPerf mute: anArrayOfSymbols 
]

{ #category : 'playing' }
TurboPhausto >> play [

	self class tpPerf play
]

{ #category : 'playing' }
TurboPhausto >> playFor: aNumberOfBars [

	self class tpPerf playFor: aNumberOfBars
]

{ #category : 'playing' }
TurboPhausto >> solo: aSymbol [

	self class tpPerf solo: aSymbol
]

{ #category : 'playing' }
TurboPhausto >> stop [

	self class tpPerf stop
]
