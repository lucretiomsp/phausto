"
Synthesiser with selectable Oscillators/Noise with a basic LFO for pitch and a AM Modulation on output. Connected to a basic ADSR envelope.
Inspired by the Progrmmable Sound Generator (SN76496) used on Sega Master System and MegaDrive.
The index parameter select the type of waveform: Square / Saw / Pulse / Triangula / Noise.
lfoAMount controls the amount of LFO on Pitch.

"
Class {
	#name : 'PsgPlus',
	#superclass : 'TpSynth',
	#instVars : [
		'lfoAmount',
		'index'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
PsgPlus >> asBox [

	| adsr sqr saw tri noise pitchLfo selectorInputs synth ringModulator |
	"lfo for Pitch"
	pitchLfo := self pitch asBox
	            +
		            ((LFOSquareWavePos new freq:
			              self pitch asBox * (1 / 48) asBox)
		             * (self lfoAmount asBox * self pitch asBox)).
	"ring modulator"
	ringModulator := 1 asBox - (SineOsc new
		                  freq: 242;
		                  uLevel: 0.3).

	"Oscillators"
	sqr := SquareOsc new freq: pitchLfo.
	tri := TriOsc new freq: pitchLfo.
	saw := SawOsc new freq: pitchLfo.
	noise := ResonBp new
		         input: (DownSampler new input: Noise new);
		         frequency: pitchLfo asBox * 3 asBox;
		         q: 4.

	"Envelope"
	adsr := (ADSREnv new
		         attack: 0.01;
		         decay: 0.2;
		         sustain: 0.3;
		         release: 0.2;
		         trigger: self gate) asBox.
	selectorInputs := self index asBox , sqr , saw , tri , noise.
	synth := (selectorInputs connectTo: PhSelect4 new) * adsr asBox
	         * self level * ringModulator.
	^ synth * self level
]

{ #category : 'accessing' }
PsgPlus >> index [

	^ index
]

{ #category : 'accessing' }
PsgPlus >> index: anIndex [

	index := anIndex asBox
]

{ #category : 'initialization' }
PsgPlus >> initialize [

	super initialize.
	self index: (PhHSlider new
			 label: self name , 'Index'
			 init: 0
			 min: 0
			 max: 3
			 step: 1).
	self lfoAmount: (PhHSlider new
			 label: self name , 'LfoAmount'
			 init: 0
			 min: 0
			 max: 10
			 step: 0.001).
	self level: 0.3 "level is sofwtare than TpSynth default"
]

{ #category : 'accessing' }
PsgPlus >> lfoAmount [

	^ lfoAmount
]

{ #category : 'accessing' }
PsgPlus >> lfoAmount: aNumber [

	lfoAmount := aNumber asBox
]
