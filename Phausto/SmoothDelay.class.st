"
s(mooth)delay: a mono delay that doesn't click and doesn't transpose when the delay time is changed.
Interpolation time (in seconds) is by default 0.1 seconds
"
Class {
	#name : #SmoothDelay,
	#superclass : #Delays,
	#instVars : [
		'interpolationTime'
	],
	#category : #'Phausto-BoxAPI-Effects'
}

{ #category : #converting }
SmoothDelay >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , self interpolationTime asBox
	            , self delayLength asBox , self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
SmoothDelay >> initialize [

	super initialize.
	processExpression := 'process = de.sdelay;' .
	self interpolationTime: 0.1 asBox * PhSampleRate new asBox
]

{ #category : #accessing }
SmoothDelay >> interpolationTime [

	^ interpolationTime
]

{ #category : #accessing }
SmoothDelay >> interpolationTime: aFloatOrABox [

	interpolationTime := aFloatOrABox asBox
]
