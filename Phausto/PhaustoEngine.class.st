"
An abstract superclass for TurboPhausto engines to be used with Coypu for live coding
"
Class {
	#name : 'PhaustoEngine',
	#superclass : 'Object',
	#classInstVars : [
		'allSamplers',
		'tpDsp',
		'tpPerf',
		'allSynths',
		'lpf',
		'hpf',
		'allEffects',
		'rack'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
PhaustoEngine class >> allEffects [

	^ allEffects
]

{ #category : 'accessing' }
PhaustoEngine class >> allInstruments [

	^ allSamplers , allSynths asArray
]

{ #category : 'accessing' }
PhaustoEngine class >> allSamplers [

	^ allSamplers 
]

{ #category : 'accessing' }
PhaustoEngine class >> allSynths [

	^ allSynths 
]

{ #category : 'loading' }
PhaustoEngine class >> loadAllSamplers [ 

self subclassResponsibility 
]

{ #category : 'loading' }
PhaustoEngine class >> loadAllSynths [

	self subclassResponsibility
]

{ #category : 'loading' }
PhaustoEngine class >> loadEffects [

	self subclassResponsibility
]

{ #category : 'loading' }
PhaustoEngine class >> loadFilters [

	self subclassResponsibility
]

{ #category : 'accessing' }
PhaustoEngine class >> start [
	"load all the Turbo- Samplers, Synths and Effects. initialize and start a dsp and assign it to a Performance"

	| perf |
	perf := Performance uniqueInstance.
	self loadAllSamplers.
	self loadAllSynths.
	self loadFilters.
	self loadEffects.
	self loadRack.


	self tpDsp ifNotNil: [
		self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	"tpDsp := self allSamplers asSumOfUGen stereo asDsp."
	tpDsp := self rack stereo asDsp.
	[
	[ [ self tpDsp ] value ifNotNil: [ self tpDsp init ] ] value
		ifNotNil: [ self tpDsp start ] ] fork.
	tpPerf := perf forDsp: tpDsp.
	tpPerf performanceType: PerfType new.
]

{ #category : 'accessing' }
PhaustoEngine class >> tpDsp [

	^ tpDsp.
]

{ #category : 'accessing' }
PhaustoEngine class >> tpPerf [

^ tpPerf 
]

{ #category : 'accessing' }
PhaustoEngine class >> traceAllInstruments [

Transcript clear.
self listOfSamplesFolder do: [ :i | Transcript  show: i; cr ].
Transcript open
]

{ #category : 'API - changes' }
PhaustoEngine >> bpm: aNumber [

self class tpPerf freq: aNumber bpm
]

{ #category : 'displaying' }
PhaustoEngine >> displayUIForLevels [ 

	self class tpDsp displayUIForLevels
]

{ #category : 'initialization' }
PhaustoEngine >> initialize [

	super initialize.
	self class tpPerf resetAllSequencers.
	self class tpPerf maxStepNumber: SmallInteger maxVal .
	self muteAll
]

{ #category : 'playing' }
PhaustoEngine >> mute: aSymbol [

	self class tpPerf mute: aSymbol 
]

{ #category : 'playing' }
PhaustoEngine >> muteAll [

	self class tpPerf muteAll
]

{ #category : 'playing' }
PhaustoEngine >> play [

	self class tpPerf play
]

{ #category : 'playing' }
PhaustoEngine >> playFor: aNumberOfBars [

	self class tpPerf playFor: aNumberOfBars
]

{ #category : 'API - changes' }
PhaustoEngine >> playNote: aMidiNN prefix: aString dur: aDuration [
	"Send a gate dur: aDuration in seconds to the parameter named aString, Gate and a MidiNN converted to Hertz to  the parameter named aString , Note"
	self class playNote: aMidiNN prefix: aString dur: aDuration
	"Send a gate dur: aDuration in seconds to the parameter named aString, Gate and a MidiNN converted to Hertz to  the parameter named aString , Note"
]

{ #category : 'playing' }
PhaustoEngine >> solo: aSymbol [

	self class tpPerf solo: aSymbol
]

{ #category : 'playing' }
PhaustoEngine >> stop [

	self class tpPerf stop
]

{ #category : 'accessing' }
PhaustoEngine >> tpDsp [

	^ self class tpDsp
]

{ #category : 'accessing' }
PhaustoEngine >> tpPerf [ 

^ self class tpPerf 
]

{ #category : 'tracing' }
PhaustoEngine >> traceAllParams [ 

self class tpDsp traceAllParams 
]

{ #category : 'API - changes' }
PhaustoEngine >> trig: aString [
	"send a 10 ms trigger to a Faust parameter, designed to trig envelopes and percussions-like sounds"

	self class tpDsp trig: aString
]

{ #category : 'playing' }
PhaustoEngine >> unmute: aSymbol [

	self class tpPerf unmute: aSymbol 
]

{ #category : 'LiveCoding - Performance' }
PhaustoEngine >> unsolo: aSymbol [

	self class tpPerf unsolo: aSymbol
]
