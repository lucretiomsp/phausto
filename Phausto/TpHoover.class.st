"
Hoover inspired sound modeled after Roland Alpha Juno sound but using two Sawtooth waves instead of a Pulse with modulated PWM
"
Class {
	#name : 'TpHoover',
	#superclass : 'TpSynth',
	#instVars : [
		'modIndex',
		'modRatio',
		'oscillators',
		'ampEnv'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
TpHoover >> asBox [

self uLevel: #hooveruLevel .
	^ (oscillators => ampEnv) * self uLevel
]

{ #category : 'initialization' }
TpHoover >> initialize [

	| pitchEnv pitchEnvAmt |
	super initialize.
	label := 'hoover'.
	trigger := PhButton new label: self label , 'Trigger'.
	self controlParameters add: #trigger -> (self trigger
			 asControlParameterOfWidgetType: #button
			 description: 'Trig Envelopes').
	pitchEnv := ADSREnv new
		            label: #PE;
		            trigger: #hooverGate;
		            attack: 0 asBox;
		            decay: 1 asBox;
		            release: 0.6 asBox;
		            sustain: 0 asBox.
	pitchEnvAmt := 126.
	pitch := (PhHSlider new
		          label: 'hooverNote'
		          values: #( 200 20 2000 1 )) + (pitchEnv * pitchEnvAmt).
	oscillators := (SawOsc new freq: pitch) + (SawOsc new
		                uLevel: 0.3 asBox;
		                freq: pitch + 3) + (SawOsc new
		                uLevel: 0.3 asBox;
		                freq: pitch * 2 + 3) + (TriOsc new
		                uLevel: 0.3 asBox;
		                freq: pitch * 0.5).
	ampEnv := ADSREnv new
		          trigger: #hooverGate;
		          attack: 0 asBox;
		          decay: 0.2 asBox;
		          sustain: 0.5 asBox;
		          release: 0.35 asBox
]
