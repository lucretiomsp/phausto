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
		'freq',
		'gain',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
SawTrombone >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self gain asBox , self gate asBox
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

{ #category : 'accessing' }
SawTrombone >> gate [

	^ gate 
]

{ #category : 'initialization' }
SawTrombone >> initialize [

	super initialize.
	processExpression := 'process = sy.sawTrombone;'.
	freq := PhHSlider new
		        label: self label , 'Note'
		        init: 440
		        min: 20
		        max: 1400
		        step: 0.1.
		freq := PhHSlider new
			          label: self label , 'Note'
			          init: 440
			          min: 20
			          max: 1200
			          step: 1.
	self controlParameters add: #freq -> (self freq
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').
	gate := PhButton new label: self label , 'Gate'.
	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.3
		        min: 0
		        max: 1
		        step: 0.001
]
