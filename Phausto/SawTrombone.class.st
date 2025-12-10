"
A simple trombone based on a lowpassed sawtooth wave. sawTrombone is a standard Faust function.


freq: the frequency in Hz
gain: the gain (0-1)
gate: the gate (0 or 1)
"
Class {
	#name : 'SawTrombone',
	#superclass : 'Synths',
	#instVars : [
		'gain'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
SawTrombone >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self gain asBox , self trigger  asBox
		            connectTo: intermediateBox.
	^ finalBox *  self uLevel
]

{ #category : 'accessing' }
SawTrombone >> freq [

	^ freq
]

{ #category : 'accessing' }
SawTrombone >> gain [

	^ gain 
]

{ #category : 'initialization' }
SawTrombone >> initialize [

	super initialize.
	processExpression := 'process = sy.sawTrombone;'.


	self controlParameters add: #freq -> (self freq asControlParameterOfWidgetType: #knob description: 'Frequency in Hertz').

	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.3
		        min: 0
		        max: 1
		        step: 0.001
]
