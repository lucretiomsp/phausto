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
		        pathToFolder: self turboSamplesFolder , '/kick';
		        label: 'kick'.
	clap := TpSampler new
		        pathToFolder:
			        self turboSamplesFolder , '/clap';
		        label: 'clap'.
	snare := TpSampler new
		         pathToFolder:
			         self turboSamplesFolder , '/snare';
		         label: 'snare'.
	ch := TpSampler new
		      pathToFolder: self turboSamplesFolder , '/ch';
		      label: 'ch'.
	rim := TpSampler new
		       pathToFolder: self turboSamplesFolder , '/rim';
		       label: 'rim'.
	oh := TpSampler new
		      pathToFolder: self turboSamplesFolder , '/oh';
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

{ #category : 'examples' }
EcoPhausto class >> openBusinessCard [

| code |
code := '"Start EcoPhausto, you should hear all its sound playing together".
EcoPhausto start.

"create a new instance of EcoPhausto"
ep := EcoPhausto new.

"you can see all the EcoPhausto instruments in a Transcript"
EcoPhausto listAllInstruments. 

"play the Performance"
ep playFor: 128 bars. 
"it is empty now but we will add a sequencer to it in the following lines"
"Sequencers can be created by sending the asSeq message to an array of 1 and 0"
 #(1 0 0 1 0 0 0 0) asSeq to: #kick.
"or by sending the asRhythm message to a valid rhythm preceded by an hash (that''s a Pharo symbol btw)"
#rumba asRhythm to: #conga.
"CMD+i (Mac) or CTRL+I (Win/Linux) on the next line to open an Inspector on the list of available rhythm"
Rhythm list.
"but if you want to type less (losing iconicity), just send the message to: to a valid rhythm"
#plena to: #conga.
"or sending the hexBeat message to a string containing only hexadecimal characters"
''020F'' hexBeat to: #snare.
"sending the index: message to a Sequence with a string of integers as an argument changes the samples indexes(if playing a TpSampler), which by default are all 0s" 
16 quavers index: ''0 1 2 3 '' to: #blip.
"sequencers can be joined with a comma - binary operator for joining collections in Pharo"
16 quavers , 16 semiquavers to: #oh.
"we can mute sequencers"
ep mute: #(#kick #snare #blip).
"and unmute them"
ep unmute: #(#kick #snare).
"you can create randomTrigs - and then cascade a string to change the level of the sound"
16 randomTrigs to: #ch; level: ''0.8 0.4 0.3''.
"or randomTrigs with a probability"
(16 randomTrigsWithProbability: 65) to: #ch.
"different samples inside the same folder can be played"
#ch index: 7 asRisingArray .
"also you can play samples of different folders, from the same Performance track"
''clap , snare ,  cowbell*2'' asDirtSounds to: #mix ; notes: ''60 38 72 56''.
"or you can create Sequencers by sending the asDirtNotes message to a string containin MIDI note numbers"
''-/8 , 38 , 56*2 , -/4 , 41 , 66'' asDirtNotes to: #acid; envMod: ''0.8 0.2 0.3''.
"or a string with noteletters and octave number , using # for sharps and b for flats"
''c4, a4, f4*3, eb4, g#2, c1/2'' asDirtNotes to: #acid.
"if octave number is missing, notes are considering from octave 4"
''c, a , f , e '' asDirtNotes to: #acid.
"or sending asDirtIndex if you want to play a different sample in the folder (if more than one available)"
"sending the notes: message to a Sequence with a string of MIDI notes as an argument changes the notes of the Sequencer, which by default are all 60 (C3)."
''1 , -/16 . 7 , -/9 , 12 , -/12, 18'' asDirtIndex notes: ''38 45 78 62  81'' to: #speakspell.
"Euclidean rhythms can be created by sending the euclidean message to an array, where the first element is the number of steps and the second is the number of pulses."

#(5 16) euclidean index: '' 1 3 5 2''; to:  #bongo.
"Trigs inside a Sequencer can be offset forward"
#(5 16) euclidean offset: 1; to: #cowbell.
"or backwards"
"levels can be changed sending a message to the corresponding Performance key"
#shiko asRhythm to: #clap ; level: ''0.3  0.1 0.4''.

"we can arpeggiate the notes of a Sequencer"
#cumbiaClave asRhythm arpeggiate: ''12-sus4 0-min''; to: #psg; level: ''0.4''.
"or we can random walk through a scale over an octave span from a root note"
64 randomTrigs notes: (32 randomWalksOn: Scale sakura octaves: 2 root: 48) to: #psg.

"sequencers can be soloed"
ep solo: #(#psg #cowbell).
"and unsoloed - that takes the performance back to the status between the solo"
ep unsolo: #(#psg #cowbell).

"Performance can be temporary saved"
ep temporarySave.

"bpm can be changed"
ep bpm: 96.

"saved Performance can be restored"
ep restore.

"the same rhythm can be assigned to many Sequencers"
#(#kick #ch #cowbell ) rhythm: #banda .

"we can loop a certain amount of steps"
ep loop: 5.

"unloop"
ep unloop.

"set all the Seqeuncers to the same rhythm"
ep rhythm: ''1312'' hexBeat.

"stop the performance"
ep stop.

"UZU PLAYBACK"

ep  playCyclicFor: 96 bars.

''<c6 ~ d3 a2>*64'' asMondoNotes to: #acid.

''60*4 ~ 72*2'' asMondoNotes to: #kick.
''<snare rim  blip cowbell>*8'' asMondoSounds to: #mix.
''80 70 76 [77*5]'' asMondoNotes to: #clap; 

"but traditional Coypu method can be used also in the cyclic playback, sequencer length will be trimmed to 16 steps"
16 upbeats to: #ride.
ep solo: #acid.
#downbeats asRhythm to: #kick.
#(3 16) euclidean to: #rim.
16 randomTrigs to: #blip; index: ''1 2 3 ''; notes: ''40 51''.
ep mute: #blip.

ep stop.

'.


StPlayground new contents: code ; open
]

{ #category : 'accessing' }
EcoPhausto class >> start [ 

AllInstruments := OrderedCollection new.
super start
]
