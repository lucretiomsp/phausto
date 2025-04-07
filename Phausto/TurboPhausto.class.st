"
This class is used to load all the instruments of TurboPhausto.
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
			1 to: size do: [ :i | (allSamplers at: i) name: (allLabels at: i) ].

			^ allSamplers ]
		ifFalse: [
			^ Error new signal:
				  'Please place TurboSamples folder in your Documents Folder' ]
]

{ #category : 'loading' }
TurboPhausto class >> loadAllSynths [

"load all TurboSynths - kept empty for now"
allSynths := #()
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
	tpDsp := self allInstruments asSumOfUGen stereo
		         asDsp.
	[ 0.1 seconds wait ] fork.
		         tpDsp init.
		[ 0.1 seconds wait ] fork.
		         tpDsp start.
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
TurboPhausto >> play [

	self class tpPerf play
]

{ #category : 'playing' }
TurboPhausto >> playFor: aNumberOfBars [

	self class tpPerf playFor: aNumberOfBars
]
