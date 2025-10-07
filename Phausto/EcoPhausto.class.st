"
Lighter version of TurboPhausto designed for improved performance on Windows/Linux without audio interface.
Less instruments, no effects nor filters on output.

One sample for: 
**#kick**
**#snare**
**#ch**
**#oh**
**#cowbell**

Multiple Samples for 
**#bongo** (8 samples)
**conga** (14 samples)
**#bleep** (6 samples)
**#speakspell** (28 samples)

And the following synths:
**#psg**
**#acid**
"
Class {
	#name : 'EcoPhausto',
	#superclass : 'TurboPhausto',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'tracing' }
EcoPhausto class >> listOfInstruments [

Transcript open; clear; show: 'One sample for: 
#kick
#snare
#ch
#oh
#cowbell

MultiSamples for 
#bongo 
#conga (14 samples)
#bleep (6 samples)
#speakspell (28 samples)

Synths:
#psg
#acid'
]

{ #category : 'accessing' }
EcoPhausto class >> start [

	| kick snare ch oh cowbell conga acid perf bongo bleep psg speakspell |
	perf := Performance uniqueInstance.
	kick := TpSampler new
		        pathToFile: self turboSamplesFolder , '/kick/BD_full909.wav';
		        label: 'kick'.
	snare := TpSampler new
		         pathToFile:
			         self turboSamplesFolder , '/snare/SD_Drumaxia.wav';
		         label: 'snare'.
	ch := TpSampler new
		      pathToFile: self turboSamplesFolder , '/ch/CH_Juxtapos.wav';
		      label: 'ch'.
	oh := TpSampler new
		      pathToFile: self turboSamplesFolder , '/oh/OH_Punchtron.wav';
		      label: 'oh'.
	cowbell := TpSampler new
		           pathToFile:
			           self turboSamplesFolder , '/cowbell/Cow1-R50.wav';
		           label: 'cowbell'.
	conga := TpSampler new
		         pathToFolder: self turboSamplesFolder , '/conga';
		         label: 'conga'.
	bongo := TpSampler new
		         pathToFolder: self turboSamplesFolder , '/bongo';
		         label: 'bongo'.
	bleep := TpSampler new
		         pathToFolder: self turboSamplesFolder , '/bleep';
		         label: 'bleep'.
	speakspell := TpSampler new
		              pathToFolder: self turboSamplesFolder , '/speakspell';
		              label: 'speakspell'.
	psg := PsgPlus new label: 'psg'.
	acid := Acid new label: 'acid'.


	self tpDsp ifNotNil: [
		self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	tpDsp := (kick + snare + ch + oh + cowbell + conga + bongo + bleep
	          + speakspell + acid + psg) stereo asDsp.
	"tpDsp := self rack stereo asDsp."
	[
	[ [ self tpDsp ] value ifNotNil: [ self tpDsp init ] ] value
		ifNotNil: [ self tpDsp start ] ] fork.

	tpPerf := perf forDsp: tpDsp
]

{ #category : 'initialization' }
EcoPhausto >> initialize [


self class tpPerf resetAllSequencers.
	self muteAll
]
