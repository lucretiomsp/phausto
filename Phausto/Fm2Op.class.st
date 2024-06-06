"
Two operator FM synthesiser with ADSR envelope. Index values in the range 0-100 .
"
Class {
	#name : #Fm2Op,
	#superclass : #TpSynth,
	#instVars : [
		'modulatorPitch',
		'modIndex'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
Fm2Op >> asBox [

	| carrier modulator adsr |
	adsr := (ADSREnv new
		         attack: self attack;
		         decay: self decay;
		         sustain: self sustain;
		         release: self release;
		         trigger: self gate) asBox.
	modulator := (SineOsc new freq: self modulatorPitch) * self index
	             * 80 asBox.
	carrier := SineOsc new freq: self pitch + modulator asBox.
	^ carrier asBox * adsr asBox * self level
]

{ #category : #initialization }
Fm2Op >> initialize [

	super initialize.
		self index: 1.
	self modulatorPitch: 220.
	self pitch: 440.
]

{ #category : #accessing }
Fm2Op >> modIndex [

	^ modIndex 
]

{ #category : #accessing }
Fm2Op >> modIndex: aNumber [

	modIndex := aNumber asBox
]

{ #category : #accessing }
Fm2Op >> modulatorPitch [

	^ modulatorPitch
]

{ #category : #accessing }
Fm2Op >> modulatorPitch: aFrequency [ 

	modulatorPitch := aFrequency asBox.
]
