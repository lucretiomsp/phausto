"
Two operator FM synthesiser with ADSR envelope. Index values in the range 0-100 .
"
Class {
	#name : 'Fm2Op',
	#superclass : 'TpSynth',
	#instVars : [
		'modulatorPitch',
		'modIndex'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
Fm2Op >> asBox [

	| carrier modulator adsr |
	adsr := (ADSREnv new
		         attack: self attack;
		         decay: self decay;
		         sustain: self sustain;
		         release: self release;
		         trigger: self gate) asBox.
	modulator := (SineOsc new freq: (self pitch * self modRatio asBox) * self modIndex
	             * 4000 asBox).
	carrier := SineOsc new freq: self pitch + modulator asBox.
	^ carrier asBox * adsr asBox * self level
]

{ #category : 'initialization' }
Fm2Op >> initialize [

	super initialize.
	self modIndex: (PhHSlider new
			 label: self name , 'ModIndex'
			 init: 1
			 min: 0.5
			 max: 1
			 step: 0.1).
	self modRatio: (PhHSlider new
			 label: self name , 'ModRatio'
			 init: 1
			 min: 0.1
			 max: 12
			 step: 0.01)
]

{ #category : 'accessing' }
Fm2Op >> modIndex [

	^ modIndex 
]

{ #category : 'accessing' }
Fm2Op >> modRatio [

	^ modulatorPitch
]
