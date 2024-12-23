"
An envelope with an exponential attack and release. smoothEnvelope is a standard Faust function.


Where:


ar: attack and release (sec)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'SmoothEnv',
	#superclass : 'PhEnvelope',
	#instVars : [
		'sustain',
		'ar'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'as yet unclassified' }
SmoothEnv >> ar [

	^ ar ifNil: [
		  ar := PhHSlider new
			             label: self label , 'Ar'
			             init: 0.1
			             min: 0.001
			             max: 2
			             step: 0.001 ]
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
	processExpression := 'process = en.smoothenvelope;'
]
