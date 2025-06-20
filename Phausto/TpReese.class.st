"
Reese bass synthesiser with ADSR envelope. 
"
Class {
	#name : 'TpReese',
	#superclass : 'TpSynth',
	#instVars : [
		'detune',
		'adsr',
		'osci1',
		'osci2'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
TpReese >> asBox [

	^ (osci1 + osci2) * adsr 
]

{ #category : 'initialization' }
TpReese >> initialize [

	| noteSlider |
	super initialize.
	label := 'reese'.
	self pitch: #reeseNote.
	self gate: #reeseGate.
	detune := PhHSlider new label: 'reeseDetune' values: #( 5 0 30 1 ).
	noteSlider := PhHSlider new
		              label: 'reeseNote'
		              values: #( 48 1 127 1 ).
	adsr := (ADSREnv new
		         label: 'reese';
		         attack: self attack;
		         decay: self decay;
		         sustain: self sustain;
		         release: self release;
		         trigger: self gate) asBox.
	osci1 := SineOsc new
		         freq: #reeseNote;
		         uLevel: 0.3 asBox.
	osci2 := SineOsc new
		         uLevel: 0.3 asBox;
		         freq: self pitch
			         +
				         (PhHSlider new label: 'reeseDetune' values: #( 5 0 30 1 )) "+ detune asBox"
]
