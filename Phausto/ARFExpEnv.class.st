"
**ARFE** (_Attack and Release-to-Final-value Exponentially_) envelope generator. Approximately equal to `SmoothEnvelope`(_Attack/6.91_) when Attack = Release.

## Parameters

- **attack**: attack (sec)
- **sustain**: sustain level (between 0..1)
- **finalLevel**: final level to approach upon release (such as 0)
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'ARFExpEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain',
		'finalLevel'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
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

{ #category : 'as yet unclassified' }
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
