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
		'index',
		'q',
		'dsfreq'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
PsgPlus >> asBox [

	| adsr sqr saw tri noise pitchLfo selectorInputs synth ringModulator |
	"lfo for Pitch"
	pitchLfo := self pitch asBox + ((LFOSquarePos new
		              offset: 0;
		              amount: 1;
		              freq: self pitch asBox * (1 / 48) asBox)
	             * (self lfoAmount asBox * self pitch asBox)).
	"ring modulator"
	ringModulator := 1 asBox - (SineOsc new
		                  freq: 242 asBox;
		                  uLevel: 0.3 asBox).

	"Oscillators"
	sqr := SquareOsc new
		       freq: pitchLfo;
		       uLevel: 0.3 asBox.
	tri := TriOsc new
		       freq: pitchLfo;
		       uLevel: 0.3 asBox.
	saw := SawOsc new
		       freq: pitchLfo;
		       uLevel: 0.3 asBox.
	noise := ResonBp new
		         input: (DownSampler new frequency: self dsfreq ;input: Noise new);
		         frequency: pitchLfo asBox * 3 asBox;
		         q: self q .

	"Envelope"
	adsr := (ADSREnv new
		         attack: self attack;
		         decay: self decay;
		         sustain: self sustain;
		         release: self release;
		         trigger: self gate) asBox.
	selectorInputs := self index asBox , sqr , saw , tri , noise.
	synth := (selectorInputs connectTo: PhSelect4 new) * adsr asBox
	         * self uLevel * ringModulator.
	^ synth * self uLevel
]

{ #category : 'accessing' }
PsgPlus >> dsfreq [

	^ dsfreq
]

{ #category : 'accessing' }
PsgPlus >> index [

	^ index ifNil: [ index := (PhHSlider new
			 label: self label , 'Index'
			 init: 0
			 min: 0
			 max: 3
			 step: 1)]
]

{ #category : 'accessing' }
PsgPlus >> index: anIndex [

	index := anIndex asBox
]

{ #category : 'initialization' }
PsgPlus >> initialize [

	super initialize.
	dsfreq := PhHSlider new label: 'PsgPlusDSFreq' values: #(180 20 16000 1).
	q := PhHSlider new label: 'PsgPlusQ' values: #(3 1 5 0.01).
]

{ #category : 'accessing' }
PsgPlus >> lfoAmount [

	^ lfoAmount ifNil: [
		  lfoAmount := PhHSlider new
			               label: self label , 'LfoAmount'
			               init: 0
			               min: 0
			               max: 1
			               step: 0.001 ]
]

{ #category : 'accessing' }
PsgPlus >> q [

^ q
]
