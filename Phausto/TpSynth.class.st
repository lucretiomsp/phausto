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
		'name'
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

	^ gate ifNil: [ PhButton new label: self label , 'Gate']
]

{ #category : 'initialization' }
TpSynth >> initialize [

	super initialize.
	"by default the name of the TpSynth is the name of the class"
	gate := PhButton new label: self label , 'Gate'.
	pitch := PhHSlider new
			  label: self label , 'Note'
			  init: 440
			  min: 20
			  max: 4086
			  step: 1 .
			attack := PhHSlider new
			            label: self label , 'Attack'
			            init: 0.01
			            min: 0
			            max: 4
			            step: 0.001 .
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
