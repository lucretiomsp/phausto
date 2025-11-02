"
Two operator FM synthesiser with ADSR envelope. Index values in the range 0-100 .
"
Class {
	#name : 'Fm2Op',
	#superclass : 'TpSynth',
	#instVars : [
		'modIndex',
		'modRatio'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
Fm2Op >> asBox [

	| carrier modulator carrierPitch adsr modulatorPitch |
	adsr := (ADSREnv new
		         attack: self attack;
		         decay: self decay;
		         sustain: 1 asBox;
		         release: self release;
		         trigger: self trigger) asBox.
	modulatorPitch := self pitch asBox * self modRatio asBox.
	modulator := SineOsc new
		             freq: modulatorPitch;
		             uLevel: self modIndex.
	carrierPitch := self pitch asBox + (modulator * 70 asBox).
	carrier := SineOsc new
		           freq: carrierPitch asBox;
		           uLevel: (self coypuLabel , 'uLevel') asSymbol.


	^ carrier asBox * adsr asBox
]

{ #category : 'initialization' }
Fm2Op >> initialize [

	super initialize.
	
]

{ #category : 'as yet unclassified' }
Fm2Op >> modIndex [

	^  modIndex  ifNil: [   PhHSlider new
		        label: self label , 'ModIndex'
		        init: 0
		        min: 0
		        max: 1
		        step: 0.01 ]
]

{ #category : 'as yet unclassified' }
Fm2Op >> modRatio [

	^ modRatio ifNil: [   PhHSlider new
		        label: self label , 'ModRatio'
		        init: 1
		        min: 0.01
		        max: 12
		        step: 0.01 ]
]
