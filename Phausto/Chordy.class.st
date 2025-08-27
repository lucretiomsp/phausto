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

	| filterEnv ampEnv voice1 voice2 voice3 filter freqSlider secondInterval scaledFreq |
	"enevelopes"
	filterEnv := ADSREnv new
		             attack: self attack;
		             decay: self decay;
		             sustain: 0 asBox;
		             release: self release;
		             trigger: self gate.

	ampEnv := ADSREnv new
		          attack: self attack;
		          decay: self decay;
		          sustain: self sustain;
		          release: self release;
		          trigger: self gate.
	"filter"
	freqSlider := PhHSlider new
		              label: self label , 'Cutoff'
		              init: 0.2
		              min: 0.2
		              max: 10
		              step: 0.01.
	scaledFreq := 202 asBox * freqSlider + (filterEnv * 2000 asBox).

	filter := ResonLp new
		          frequency: scaledFreq;
		          q: 4.8.

	"for the selection of modes the interval is expresed in ratio"
	secondInterval := self mode asBox , 1.189 asBox , 1.259 asBox
	                  , 1.333 asBox , 1.125 asBox connectTo:
		                  PhSelect4 new.

	"voices"
	voice1 := (SawOsc new freq: self pitch asBox; uLevel: 0.25 asBox) .

	voice2 := (SawOsc new uLevel: 0.25 ;freq: self pitch asBox * secondInterval asBox)
	          .
	" a perfect fifth as a  End of statement expected ->1.6 ratio to the root"
	voice3 := (SawOsc new uLevel ; freq: self pitch asBox * 1.5 asBox) .
	^ (filter input: voice1 + voice2 + voice3) * ampEnv asBox
	  * self uLevel asBox
]

{ #category : 'accessing' }
Chordy >> cutoff [

	^ cutoff ifNil: [ cutoff := (PhHSlider new
			 label: self label , 'Cutoff'
			 init: 20
			 min: 20
			 max: 100
			 step: 1)]
]

{ #category : 'initialization' }
Chordy >> initialize [

	super initialize.


	self decay: 0.21.
	self sustain: 0.9.
	self release: 0.18.
	self uLevel: 0.9.
	mode := (PhHSlider new
				   label: self label , 'Mode'
				   init: 0
				   min: 0
				   max: 3
				   step: 1) 
]

{ #category : 'accessing' }
Chordy >> mode [

	^ mode 
]
