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

	adsr := (ADSREnv new
		         label: 'cane';
		         attack: self attack;
		         decay: self decay;
		         sustain: self sustain;
		         release: self release;
		         trigger: self trigger) asBox.
	^ ((osci1 + osci2) * adsr) asBox "osci1 + osci2 * adsr"
]

{ #category : 'initialization' }
TpReese >> initialize [

	| noteSlider |
	super initialize.
	label := 'tpReese'. "self pitch: #ReeseFreq.
	self trigger: #reeseTrigger."
	detune := PhHSlider new label: 'tpReeseDetune' values: #( 5 0 30 1 ).
	
	osci1 := SineOsc new
		         freq: self pitch;
		         uLevel: 0.3 asBox.
	osci2 := SineOsc new
		         uLevel: 0.3 asBox;
		         freq: self pitch 
			         +
				         (PhHSlider new
					          label: 'tpReeseDetune'
					          values: #( 5 0 30 1 )) "+ detune asBox"
]
