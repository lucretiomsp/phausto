"
ASRE (Attack, Sustain, Release) envelope generator with exponential segments

Where:

at: attack (sec)
sl: sustain level (between 0..1)
rt: release (sec)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ASRExpEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
ASRExpEnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox , self sustain asBox
	            , self release asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
ASRExpEnv >> initialize [

	super initialize.
	processExpression := 'process = en.asre;'
]

{ #category : 'as yet unclassified' }
ASRExpEnv >> sustain [

	^ sustain ifNil: [
		  sustain := PhHSlider new
			             label: self label , 'Sustain'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]
