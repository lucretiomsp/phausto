"
Two operator FM synthesiser with ADSR envelope. Index values in the range 0-100 .
"
Class {
	#name : #Fm2Op,
	#superclass : #PhBox,
	#instVars : [
		'pitch',
		'modulatorPitch',
		'index',
		'gate',
		'attack',
		'decay',
		'sustain',
		'release',
		'level'
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

{ #category : #accessing }
Fm2Op >> attack [

	^ attack
]

{ #category : #accessing }
Fm2Op >> attack: aTimeInSeconds [

	attack := aTimeInSeconds asBox.
]

{ #category : #accessing }
Fm2Op >> decay [

	^ decay
]

{ #category : #accessing }
Fm2Op >> decay: aTimeInSeconds [


	decay := aTimeInSeconds asBox.

]

{ #category : #accessing }
Fm2Op >> gate [

	^ gate
]

{ #category : #accessing }
Fm2Op >> gate: aGate [

	gate := aGate asBox
]

{ #category : #accessing }
Fm2Op >> index [

	^ index
]

{ #category : #accessing }
Fm2Op >> index: aNumber [

	index := aNumber asBox
]

{ #category : #initialization }
Fm2Op >> initialize [

	super initialize.
	self attack: 0.001.
	self decay: 0.2.
	self sustain: 0.5.
	self release: 0.1.
	self index: 1.
	self modulatorPitch: 220.
	self pitch: 440.
	self gate: 0.
	self level: 0.5
]

{ #category : #accessing }
Fm2Op >> level [

	^ level
]

{ #category : #accessing }
Fm2Op >> level: aNumber [

	level := aNumber asBox 
]

{ #category : #accessing }
Fm2Op >> modulatorPitch [

	^ modulatorPitch
]

{ #category : #accessing }
Fm2Op >> modulatorPitch: aFrequency [ 

	modulatorPitch := aFrequency asBox.
]

{ #category : #accessing }
Fm2Op >> pitch [

	^ pitch
]

{ #category : #accessing }
Fm2Op >> pitch: aFrequency [

	pitch := aFrequency asBox
]

{ #category : #dependencies }
Fm2Op >> release [ 
^ release
]

{ #category : #accessing }
Fm2Op >> release: aTimeInSeconds [


	release := aTimeInSeconds asBox.

]

{ #category : #accessing }
Fm2Op >> sustain [

	^ sustain
]

{ #category : #accessing }
Fm2Op >> sustain: aNumber [

	sustain := aNumber asBox
]
