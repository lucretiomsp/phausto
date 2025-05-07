"
Lighter version of TurboPhausto designed for improved performance on Windows/Linux without audio interface.
Less instruments, no effects nor filters on output
"
Class {
	#name : 'EcoPhausto',
	#superclass : 'TurboPhausto',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
EcoPhausto class >> start [

	| kick snare ch oh cowbell conga acid perf |
	perf := Performance uniqueInstance .
	kick := TpSampler new
		        pathToFile: self turboSamplesFolder , '/kick/_full909.wav';
		        label: 'kick'.
	snare := TpSampler new
		         pathToFile:
			         self turboSamplesFolder , '/snare/SD_Drumaxia.wav';
		         label: 'snare'.
	ch := TpSampler new
		      pathToFile:
			      self turboSamplesFolder , '/ch/CH_Filtix Closed Hat.wav';
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
	acid := Acid new label: 'acid'.


self tpDsp ifNotNil: [
		self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	tpDsp := (kick + snare + ch + oh + cowbell + conga + acid) stereo asDsp.
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
