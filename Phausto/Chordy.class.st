"
I am Chordy, a simple 3 voices oscillator with controllable  mode (minor/major/ sus4 / sus2) and cutoff frequency of my resonant ;owpass filter
"
Class {
	#name : #Chordy,
	#superclass : #TpSynth,
	#instVars : [
		'mode',
		'cutoff'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
Chordy >> asBox [

	| env voice1 voice2 voice3 filter filterFreq secondInterval selectorInputs |
	"enevelope"
	env := (ADSREnv new
		        attack: self attack;
		        decay: self decay;
		        sustain: self sustain;
		        release: self release;
		        trigger: self gate) asBox.
	"filter"
	filterFreq := (self cutoff * 127 asBox * env asBox + 100 asBox) smoo.
	filter := ResonBp new frequency: 200.

	"for the selection of modes the interval is expresed in ratio"
	selectorInputs := self mode asBox , 1.189 asBox , 1.259 asBox
	                  , 1.333 asBox , 1.125 asBox.
	secondInterval := selectorInputs connectTo: PhSelect4 new.

	"voices"
	voice1 := (SawOsc new freq: self pitch) * 0.3.

	voice2 := (SawOsc new freq: self pitch * secondInterval asBox) * 0.3.
	" a perfect fifth as a 1.6 ratio to the root"
	voice3 := (SawOsc new freq: self pitch * 1.5 asBox) * 0.3.
	^ (filter input: voice1 + voice2 + voice3) * env asBox * level asBox
]

{ #category : #accessing }
Chordy >> cutoff [

	^ cutoff
]

{ #category : #accessing }
Chordy >> cutoff: aFrequency [ 

	cutoff := aFrequency asBox
]

{ #category : #initialization }
Chordy >> initialize [

	super initialize.

	self mode: (PhHSlider new
			 label: self name , 'Mode'
			 init: 0
			 min: 0
			 max: 3
			 step: 1).
	self cutoff: (PhHSlider new
			 label: self name , 'Cutoff'
			 init: 10
			 min: 10
			 max: 100
			 step: 1)
]

{ #category : #accessing }
Chordy >> mode [

	^ mode
]

{ #category : #accessing }
Chordy >> mode: aMode [

	mode := aMode asBox
]
