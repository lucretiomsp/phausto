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

	^ attack ifNil: [
		  attack := PhHSlider new
			            label: self label , 'Attack'
			            init: 0.01
			            min: 0
			            max: 4
			            step: 0.001 ]
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
	self name: (self class asString withoutSuffix: ' class').
	self
		attack: 0.001;
		decay: 0.2;
		sustain: 0.5;
		release: 0.1.
		
	self level: 0.5.
]

{ #category : 'accessing' }
TpSynth >> pitch [


	^ pitch ifNil: [   PhHSlider new
		        label: self label , 'Note'
		        init: 440
		        min: 20
		        max: 4086
		        step: 1 ]
]

{ #category : 'dependencies' }
TpSynth >> release [ 
^ release
]

{ #category : 'accessing' }
TpSynth >> sustain [

	^ sustain
]
