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
	#superclass : 'CustomPhausto',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'loading' }
EcoPhausto class >> loadAllInstruments [

	| kick snare clap ch oh rim cowbell conga bongo bleep blip speakspell psg acid |
	kick := TpSampler new
		        pathToFile: self turboSamplesFolder , '/kick/BD_full909.wav';
		        label: 'kick'.
	clap := TpSampler new
		        pathToFile:
			        self turboSamplesFolder , '/clap/CLAP_Rubydub.wav';
		        label: 'clap'.
	snare := TpSampler new
		         pathToFile:
			         self turboSamplesFolder , '/snare/SD_Drumaxia.wav';
		         label: 'snare'.
	ch := TpSampler new
		      pathToFile: self turboSamplesFolder , '/ch/CH_Juxtapos.wav';
		      label: 'ch'.
	rim := TpSampler new
		       pathToFile: self turboSamplesFolder , '/rim/RIM_Losimple.wav';
		       label: 'rim'.
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
	blip := TpSampler new
		        pathToFolder: self turboSamplesFolder , '/blip';
		        label: 'blip'.
	speakspell := TpSampler new
		              pathToFolder: self turboSamplesFolder , '/speakspell';
		              label: 'speakspell'.
	psg := PsgPlus new label: 'psg'.
	acid := Acid new label: 'acid'.

	AllInstruments addAll: {
			kick.
			snare.
			clap.
			ch.
			oh.
			cowbell.
			conga.
			bongo.
			bleep.
			blip.
			rim.
			speakspell.
			psg.
			acid }
]

{ #category : 'accessing' }
EcoPhausto class >> start [ 

AllInstruments := OrderedCollection new.
super start
]
