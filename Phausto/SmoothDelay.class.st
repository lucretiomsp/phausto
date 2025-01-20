"
s(mooth)delay: a mono delay that doesn't click and doesn't transpose when the delay time is changed.
Interpolation time (in seconds) is by default 0.1 seconds
"
Class {
	#name : 'SmoothDelay',
	#superclass : 'Delays',
	#instVars : [
		'interpolationTime'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
SmoothDelay >> asBox [

	| intermediateBox finalBox delayInSeconds |
	delayInSeconds := self interpolationTime asBox
	                  * PhSampleRate new asBox.
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , delayInSeconds asBox
	            , self interpolationTime asBox , self input asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SmoothDelay >> initialize [

	super initialize.
	processExpression := 'process = de.sdelay;'.
	
]

{ #category : 'accessing' }
SmoothDelay >> interpolationTime [

	^ interpolationTime ifNil: [
		  interpolationTime := PhHSlider new
			                       label: self label , 'InterpTime'
			                       init: 0.1
			                       min: 0.01
			                       max: 2
			                       step: 0.001 ]
]
