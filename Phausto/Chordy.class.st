"
I am Chordy, a simple 3 voices oscillator with controllable  mode (minor/major/ sus4 / sus2) and cutoff frequency of my resonant ;owpass filter
"
Class {
	#name : 'Chordy',
	#superclass : 'TpSynth',
	#instVars : [
		'mode',
		'cutoff'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
Chordy >> asBox [

	| env voice1 voice2 voice3 filter filterFreq secondInterval  |
	"enevelope"
	env := (ADSREnv new
		        attack: self attack;
		        decay: self decay;
		        sustain: self sustain;
		        release: self release;
		        trigger: self gate) asBox.
	"filter"
	filterFreq := (self cutoff * 100 asBox * env asBox + 100 asBox) smoo.

	filter := ResonLp new frequency: filterFreq.

	"for the selection of modes the interval is expresed in ratio"
	secondInterval := self mode asBox , 1.189 asBox , 1.259 asBox
	                  , 1.333 asBox , 1.125 asBox connectTo:
		                  PhSelect4 new.

	"voices"
	voice1 := (SawOsc new freq: self pitch asBox) * 0.3.

	voice2 := (SawOsc new freq: self pitch asBox * secondInterval asBox)
	          * 0.3.
	" a perfect fifth as a  End of statement expected ->1.6 ratio to the root"
	voice3 := (SawOsc new freq: self pitch asBox * 1.5 asBox) * 0.3.
	^ (filter input: voice1 + voice2 + voice3) * env asBox
	  * self uLevel asBox
]

{ #category : 'accessing' }
Chordy >> cutoff [

	^ cutoff ifNil: [ cutoff := (PhHSlider new
			 label: self label , 'Cutoff'
			 init: 10
			 min: 10
			 max: 100
			 step: 1)]
]

{ #category : 'initialization' }
Chordy >> initialize [

	super initialize.

	
	
	self sustain: 0.9.
	self uLevel: 0.9
]

{ #category : 'accessing' }
Chordy >> mode [

	^ mode ifNil: [ self mode: (PhHSlider new
			 label: self label , 'Mode'
			 init: 0
			 min: 0
			 max: 3
			 step: 1). ]
]
