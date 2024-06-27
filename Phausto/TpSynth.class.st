"
TpSynth stands for TurboPhauto Synth. WIll be later moved to the TurboPhausto package
"
Class {
	#name : #TpSynth,
	#superclass : #PhBox,
	#instVars : [
		'level',
		'pitch',
		'gate',
		'attack',
		'decay',
		'sustain',
		'release',
		'name'
	],
	#category : #'Phausto-TurboPhausto'
}

{ #category : #accessing }
TpSynth >> attack [

	^ attack
]

{ #category : #accessing }
TpSynth >> attack: aTimeInSeconds [

	attack := aTimeInSeconds asBox.
]

{ #category : #accessing }
TpSynth >> decay [

	^ decay
]

{ #category : #accessing }
TpSynth >> decay: aTimeInSeconds [


	decay := aTimeInSeconds asBox.

]

{ #category : #accessing }
TpSynth >> gate [

	^ gate
]

{ #category : #accessing }
TpSynth >> gate: aGate [

	gate := aGate asBox
]

{ #category : #initialization }
TpSynth >> initialize [

	super initialize.
	"by default the name of the TpSynth is the name of the class"
	self name: (self class asString withoutSuffix: ' class').
	self
		attack: 0.001;
		decay: 0.2;
		sustain: 0.5;
		release: 0.1;
		gate: (PhHSlider new
				 label: self name , 'Gate'
				 init: 0
				 min: 0
				 max: 1
				 step: 1).
	self level: 0.5.
	self pitch: (PhHSlider new
			 label: self name , 'Note'
			 init: 440
			 min: 10
			 max: 4000
			 step: 0.1)
]

{ #category : #accessing }
TpSynth >> level [

	^ level
]

{ #category : #accessing }
TpSynth >> level: aNumber [

	level := aNumber asBox 
]

{ #category : #accessing }
TpSynth >> name [ 
^ name
]

{ #category : #accessing }
TpSynth >> name: aName [

	name := aName
]

{ #category : #accessing }
TpSynth >> pitch [

	^ pitch
]

{ #category : #accessing }
TpSynth >> pitch: aFrequency [

	pitch := aFrequency asBox
]

{ #category : #dependencies }
TpSynth >> release [ 
^ release
]

{ #category : #accessing }
TpSynth >> release: aTimeInSeconds [


	release := aTimeInSeconds asBox.

]

{ #category : #accessing }
TpSynth >> sustain [

	^ sustain
]

{ #category : #accessing }
TpSynth >> sustain: aNumber [

	sustain := aNumber asBox
]
