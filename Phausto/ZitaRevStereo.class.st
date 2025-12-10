"
FDN+Schroeder reverberator, Free open-source C++ for Linux by Fons Adriaensen,Extend zita_rev_fdn to include zita_rev1 input/output mapping in stereo mode.
More about the Zita Reverb at: https://ccrma.stanford.edu/~jos/Reverb/Zita_Rev1_Reverberator.html.
Parameters:

rdel = delay (in ms) before reverberation begins (e.g., 0 to ~100 ms)
f1: crossover frequency (Hz) separating dc and midrange frequencies
f2: frequency (Hz) above f1 where T60 = t60m/2 (see below)
t60dc: desired decay time (t60) at frequency 0 (sec)
t60m: desired decay time (t60) at midrange frequencies (sec)
"
Class {
	#name : 'ZitaRevStereo',
	#superclass : 'Reverbs',
	#instVars : [
		'rdel',
		'f1',
		'f20',
		't60dc',
		't60m',
		'fsmax'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
ZitaRevStereo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self rdel asBox , self f1 asBox , self f2 asBox
	            , self t60dc asBox , self t60m asBox , self fsMax asBox
	            , self inputL asBox , self inputR asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
ZitaRevStereo >> f1 [

	^ fsmax ifNil: [ f1:= PhHSlider new
			 label: self label , 'F1'
			 init: 200
			 min: 20
			 max: 4100
			 step: 1 ]
]

{ #category : 'accessing' }
ZitaRevStereo >> f2 [

	^ fsmax ifNil: [ f1:= PhHSlider new
			 label: self label , 'F1'
			 init: 200
			 min: 20
			 max: 6100
			 step: 1 ]
]

{ #category : 'accessing' }
ZitaRevStereo >> fsMax [

	^ fsmax ifNil: [ fsmax:= PhHSlider new
			 label: self label , 'FsMax'
			 init: 44100
			 min: 20
			 max: 44100
			 step: 1 ]
]

{ #category : 'initialization' }
ZitaRevStereo >> initialize [

	super initialize.
	processExpression := 'process = re.zita_rev1_stereo;'.
	fsmax := 44100 
]

{ #category : 'accessing' }
ZitaRevStereo >> rdel [

	^ fsmax ifNil: [ f1:= PhHSlider new
			 label: self label , 'RDel'
			 init: 1
			 min: 0
			 max: 100
			 step: 1 ]
]

{ #category : 'accessing' }
ZitaRevStereo >> t60dc [

	^ t60dc ifNil: [ t60dc:= PhHSlider new
			 label: self label , 'T60dc'
			 init: 1
			 min: 0.1
			 max: 6
			 step: 0.01 ]
]

{ #category : 'accessing' }
ZitaRevStereo >> t60m [

	^ t60m ifNil: [ t60m:= PhHSlider new
			 label: self label , 'T60m'
			 init: 1
			 min: 0.1
			 max: 6
			 step: 0.01 ]
]
