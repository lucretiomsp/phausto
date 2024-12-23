"
ARFE (Attack and Release-to-Final-value Exponentially) envelope generator. Approximately equal to smoothEnvelope(Attack/6.91) when Attack == Release.

Where:

at: attack (sec)
sl: sustain level (between 0..1)
finalLevel: final level to approach upon release (such as 0)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ARFExpEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain',
		'finalLevel'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
ARFExpEnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self attack asBox 
	            , self release asBox , self finalLevel , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
ARFExpEnv >> finalLevel [


	^ finalLevel ifNil: [
		  finalLevel := PhHSlider new
			             label: self label , 'FinalLevel'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]

{ #category : 'initialization' }
ARFExpEnv >> initialize [

	super initialize.
	processExpression := 'process = en.asr;'
]

{ #category : 'as yet unclassified' }
ARFExpEnv >> sustain [

	^ sustain ifNil: [
		  sustain := PhHSlider new
			             label: self label , 'Sustain'
			             init: 0.5
			             min: 0
			             max: 1
			             step: 0.001 ]
]
