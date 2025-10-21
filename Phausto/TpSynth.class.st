"
TpSynth stands for TurboPhauto Synth. WIll be later moved to the TurboPhausto package
"
Class {
	#name : 'TpSynth',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'pitch',
		'gate',
		'attack',
		'decay',
		'sustain',
		'release',
		'name',
		'trigger'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
TpSynth >> attack [

	^ attack 
]

{ #category : 'accessing' }
TpSynth >> decay [

	^ decay 
]

{ #category : 'accessing' }
TpSynth >> gate [

	^ gate 
]

{ #category : 'initialization' }
TpSynth >> initialize [

	super initialize.
	super initializeControlParameters. "by default the name of the TpSynth is the name of the class"
	gate := PhButton new label: self label , 'Trigger'.

	self uLevel: (self label , 'Level') asSymbol.

	pitch := PhHSlider new
		         label: self label , 'Freq'
		         init: 440
		         min: 20
		         max: 4086
		         step: 1.
	self controlParameters add: #pitch -> (self pitch asControlParameterOfWidgetType: #knob description: 'Frequency in Hertz').
	attack := PhHSlider new
		          label: self label , 'Attack'
		          init: 0.01
		          min: 0
		          max: 4
		          step: 0.001.
	decay := PhHSlider new
		         label: self label , 'Decay'
		         init: 0.2
		         min: 0.001
		         max: 2
		         step: 0.001.
	sustain := PhHSlider new
		           label: self label , 'Sustain'
		           init: 0.5
		           min: 0
		           max: 1
		           step: 0.001.
	release := PhHSlider new
		           label: self label , 'Release'
		           init: 0.1
		           min: 0.001
		           max: 2
		           step: 0.001
]

{ #category : 'initialization' }
TpSynth >> initializeControlParameters [ 
super initializeControlParameters .
self controlParameters add: 

#Attack -> (PhControlParameter new
			 label: #Attack;
			 min: 0;
			max: 1;
			step: 0.001;
			 description: 'Attack Time';
			 value: self attack;
			 widgetType: #knob)
]

{ #category : 'accessing' }
TpSynth >> label: aString [

"to adhere with Cooypu syntax, we change the prefix of the pitch parameter"
super label: aString .
self pitch: (aString , 'Note') asSymbol 
]

{ #category : 'accessing' }
TpSynth >> pitch [


	^ pitch 
]

{ #category : 'dependencies' }
TpSynth >> release [

	^ release 
]

{ #category : 'accessing' }
TpSynth >> sustain [

	 ^ sustain 
]

{ #category : 'accessing' }
TpSynth >> trigger [

^ trigger
]
