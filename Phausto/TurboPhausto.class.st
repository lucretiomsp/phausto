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
TurboPhausto class >> allEffects [

	^ allEffects
]

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

{ #category : 'examples' }
TurboPhausto class >> example1 [

	^ '
	

TurboPhausto start.
TurboPhausto loadEffects .

TurboPhausto allEffects at: #reverb.


tp := TurboPhausto new.
tp bpm: 160.
tp playFor: 64 bars.
tp stop.

TurboPhausto tpDsp traceAllParams.
#jungleKick rhythm to: #sykick.
''00000000F''hexBeat  to: #blip.
#jungleSnare rhythm to: #snare.
#jungleRim rhythm to: #rim.
16 quavers to: #ch; index: ''3''.
16 semiquavers to: #tamb.
''0002'' hexBeat to: #syhat.
18 quavers  notes: ''38 , 26 , 49, 41'' ;  to: #acid.
16 rumba index: ''3 5 9'' ; to: #speakspell.
4 semibreves  notes: ''38 , 45 , 43 , 45'' ; to: #hoover.
16 banda arpeggiate: ''c-min7'' octave: -2; to: #chordy.
"it would be cool to write"
16 semiquavers  arpeggiate: ''12-min7'' octave: -2; to: #chordy.
16 claveSon to: #djembe.
tp solo: #hoover.


tp highPassSweep: #(25 12).
tp reverb: 0.3.
TurboPhausto tpDsp setValue: 1 parameter:  ''reverb''.
TurboPhausto tpDsp sweepToValue: 19000  parameter: ''lowpassfreq'' in: 10.
TurboPhausto tpDsp trig: ''marimbaGate'' for: 1 .
tp size: 0.3


'
]

{ #category : 'accessing' }
TurboPhausto class >> hpf [

	^ hpf
]

{ #category : 'accessing' }
TurboPhausto class >> listOfSamples [ 

self turboSamplesFolder asFileReference inspect.
]

{ #category : 'accessing' }
TurboPhausto class >> listOfSamplesFolder [ 

| dirs labels |
"eliminate .DS"
dirs :=  self turboSamplesFolder asFileReference children select: [ :i | i isDirectory ].
labels := dirs collect:  [:i | i pathString afterLastSlash ].
^ labels  
]

{ #category : 'accessing' }
TurboPhausto class >> listOfSynths [

| synths |
synths := #('Djembe' 
'Marimba' 'Guitar'
		'syclap'
				 
	'SyKick' 'Hat' 'DubDub' 
		 'acid' 'chordy'
				 'TpHoover' 
	'TpReese' ).
	^ synths inspect
]

{ #category : 'loading' }
TurboPhausto class >> loadAllSamplers [
	"transform all the subfolder of TurboPhausto into TpSamplers and collect themm into an Array"

	| size subDir allLabels |
	self samplesFolderExists
		ifTrue: [
			subDir := self turboSamplesFolder asFileReference children select: [
				          :i | i hasAudioFiles ].
			size := subDir size.
			allSamplers := subDir collect: [ :i |
				               TpSampler new pathToFolder: i pathString ].
			allLabels := subDir collect: [ :i |
				             i pathString  afterLastSlashOfPath ].
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
				 freq: #dubdubNote);
		add: (Acid new
				 label: 'acid';
				
				 pitch: #acidNote);
		add: (Chordy new
				 label: 'chordy';
				 pitch: #chordyNote);
		add: TpHoover new;
		add: TpReese new.
	^ self
]

{ #category : 'loading' }
TurboPhausto class >> loadEffects [

	
	allEffects := Dictionary new.

	allEffects add: #reverb -> (DryWetMonoMixer new
			 wetAmount: #reverb;
			 fx: (FreeverbMono new
					  fb2: 0.5 asBox;
					  damp: 0.3 asBox;
					  fb1: #size))
]

{ #category : 'loading' }
TurboPhausto class >> loadFilters [

	lpf := ResonLp new
		       frequency: #lowpassfreq;
		       q: #lowpassq.
	hpf := ResonHp new
		       frequency: #highpassfreq;
		       q: #highpassq
]

{ #category : 'loading' }
TurboPhausto class >> loadRack [
	"load the chain of synthesizers, effects and filter which become the TurboPhausto dsp"

	rack := self allInstruments asSumOfUGen => self lpf => self hpf
	        => (allEffects at: #reverb)
]

{ #category : 'accessing' }
TurboPhausto class >> lpf [
^ lpf
]

{ #category : 'accessing' }
TurboPhausto class >> rack [ 
^ rack
]

{ #category : 'testing' }
TurboPhausto class >> samplesFolderExists [

	^ self turboSamplesFolder asFileReference exists
]

{ #category : 'accessing' }
TurboPhausto class >> start [
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
TurboPhausto class >> tpDsp [

	^ tpDsp.
]

{ #category : 'accessing' }
TurboPhausto class >> tpPerf [

^ tpPerf 
]

{ #category : 'accessing' }
TurboPhausto class >> traceAllInstruments [

Transcript clear.
self listOfSamplesFolder do: [ :i | Transcript  show: i; cr ].
Transcript open
]

{ #category : 'accessing' }
TurboPhausto class >> turboSamplesFolder [

^ (FileLocator documents asAbsolute pathString
	                 , '/TurboSamples')
]

{ #category : 'API - changes' }
TurboPhausto >> bpm: aNumber [

self class tpPerf freq: aNumber bpm
]

{ #category : 'playing' }
TurboPhausto >> destroy [ 

	self class tpDsp destroy
]

{ #category : 'displaying' }
TurboPhausto >> destroyDsp [

self class tpDsp destroy.
]

{ #category : 'displaying' }
TurboPhausto >> displayUI [

self class tpDsp displayUI
]

{ #category : 'displaying' }
TurboPhausto >> displayUIForLevels [ 

	self class tpDsp displayUIForLevels
]

{ #category : 'API - changes' }
TurboPhausto >> highPassFreq: aFrequency [
	"aFrequency value is forced in filter range"

	self
		setValue: (aFrequency min: 22040 max: 25)
		parameter: #highpassfreq
]

{ #category : 'API - changes' }
TurboPhausto >> highPassQ: aQValue [
	"aQValue value is forced in filter range"

	self setValue: (aQValue min: 5 max: 1) parameter: #highpassq
]

{ #category : 'API - changes' }
TurboPhausto >> highPassSweep: anArrayWithAFrequencyAndATimeInSeconds [
	"aFrequency value is forced in filter range"

	| freq duration |
	freq := (anArrayWithAFrequencyAndATimeInSeconds at: 1)
		        min: 22040
		        max: 25.
	duration := anArrayWithAFrequencyAndATimeInSeconds at: 2.
	self sweepToValue: freq parameter: #highpassfreq in: duration
]

{ #category : 'initialization' }
TurboPhausto >> initialize [

	super initialize.
	self class tpPerf resetAllSequencers .
	self muteAll
]

{ #category : 'API - changes' }
TurboPhausto >> lowPassFreq: aFrequency [
	"aFrequency value is forced in filter range"

	self
		setValue: (aFrequency min: 22040 max: 25)
		parameter: #lowpassfreq
]

{ #category : 'API - changes' }
TurboPhausto >> lowPassQ: aQValue [
	"aQValue value is forced in filter range"

	self setValue: (aQValue min: 5 max: 1) parameter: #lowpassq
]

{ #category : 'API - changes' }
TurboPhausto >> lowPassSweep: anArrayWithAFrequencyAndATimeInSeconds [
	"aFrequency value is forced in filter range"

	| freq duration |
	freq := (anArrayWithAFrequencyAndATimeInSeconds at: 1)
		        min: 22040
		        max: 25.
	duration := anArrayWithAFrequencyAndATimeInSeconds at: 2.
	self sweepToValue: freq parameter: #lowpassfreq in: duration
]

{ #category : 'playing' }
TurboPhausto >> mute: aSymbol [

	self class tpPerf mute: aSymbol 
]

{ #category : 'playing' }
TurboPhausto >> muteAll [

	self class tpPerf muteAll
]

{ #category : 'playing' }
TurboPhausto >> play [

	self class tpPerf play
]

{ #category : 'playing' }
TurboPhausto >> playFor: aNumberOfBars [

	self class tpPerf playFor: aNumberOfBars
]

{ #category : 'API - changes' }
TurboPhausto >> playNote: aMidiNN prefix: aString dur: aDuration [
	"Send a gate dur: aDuration in seconds to the parameter named aString, Gate and a MidiNN converted to Hertz to  the parameter named aString , Note"
	self class playNote: aMidiNN prefix: aString dur: aDuration
	"Send a gate dur: aDuration in seconds to the parameter named aString, Gate and a MidiNN converted to Hertz to  the parameter named aString , Note"
]

{ #category : 'API - changes' }
TurboPhausto >> reverb: anAmount [
	"aSize maximum is 1 to prevent distortion"

	self setValue: (anAmount min: 0.99) parameter: 'reverb'
]

{ #category : 'API - changes' }
TurboPhausto >> setValue: aFloat parameter: aParamAsString [
	"  set the value of the parameter named aParamAsString"

	self class tpDsp setValue: aFloat parameter: aParamAsString
	"  set the value of the parameter named aParamAsString"
]

{ #category : 'API - changes' }
TurboPhausto >> size: aSize [
	"aSize maximum is 0.99 to prvenet explosion"

	self setValue: (aSize min: 0.99) parameter: 'size'
]

{ #category : 'playing' }
TurboPhausto >> solo: aSymbol [

	self class tpPerf solo: aSymbol
]

{ #category : 'playing' }
TurboPhausto >> stop [

	self class tpPerf stop
]

{ #category : 'displaying' }
TurboPhausto >> stopDsp [

self class tpDsp stop.
]

{ #category : 'API - changes' }
TurboPhausto >> sweepToValue: aTargetValue parameter: aParamAsString in: aTimeInseconds [

	self class tpDsp
		sweepToValue: aTargetValue
		parameter: aParamAsString
		in: aTimeInseconds
	"  sweep the value of the selected parameter in a TimeInSeconds - the value is update every 10 milliseconds"
]

{ #category : 'tracing' }
TurboPhausto >> traceAllParams [ 

self class tpDsp traceAllParams 
]

{ #category : 'printing' }
TurboPhausto >> traceAllSamples [

	'/Users/domenicocipriani/Documents/MFICLCSamples' asFileReference
		children do: [ :i |
		(i pathString afterLastSlash findBetweenSubstrings: '.') first
			traceCr ]
]

{ #category : 'API - changes' }
TurboPhausto >> trig: aString [
	"send a 10 ms trigger to a Faust parameter, designed to trig envelopes and percussions-like sounds"

	self class tpDsp trig: aString
]

{ #category : 'LiveCoding - Performance' }
TurboPhausto >> unsolo: aSymbol [

	self class tpPerf unsolo: aSymbol
]
