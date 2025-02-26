"
An envelope with an exponential _Attack_ and _Release_ time. 

## Parameters

- **ar**: attack and release time (sec)
- **trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'SmoothEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain',
		'ar'
	],
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'initialization' }
SmoothEnv >> ar [

	^ ar 
]

{ #category : 'converting' }
SmoothEnv >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self ar asBox , self trigger asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SmoothEnv >> initialize [

	super initialize.
	processExpression := 'process = en.smoothEnvelope;'.
	ar := PhHSlider new
			        label: self label , 'Ar'
			        init: 0.1
			        min: 0.001
			        max: 2
			        step: 0.001
]
