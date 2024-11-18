"
Two operator FM synthesiser with ADSR envelope. Index values in the range 0-100 .
"
Class {
	#name : 'Fm2Op',
	#superclass : 'TpSynth',
	#instVars : [
		'modulatorPitch',
		'modIndex',
		'modRatio'
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
	
]

{ #category : 'accessing' }
Fm2Op >> modIndex [

	^  modIndex  ifNil: [   PhHSlider new
		        label: self label , 'ModIndex'
		        init: 0
		        min: 0
		        max: 1
		        step: 0.01 ]
]

{ #category : 'accessing' }
Fm2Op >> modRatio [

	^ modRatio ifNil: [   PhHSlider new
		        label: self label , 'ModRatio'
		        init: 1
		        min: 0.01
		        max: 12
		        step: 0.01 ]
]
