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

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self maxDelayLength asBox , self interpolationTime asBox
	            , self delayLength asBox , self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
SmoothDelay >> initialize [

	super initialize.
	processExpression := 'process = de.sdelay;'.
	interpolationTime := 8200 asBox "* PhSampleRate new asBox"
]

{ #category : 'accessing' }
SmoothDelay >> interpolationTime [

	^ interpolationTime ifNil: [
		  interpolationTime := PhHSlider new
			                 label: self label , 'InterpTime'
			                 init: 1000
			                 min: 100
			                 max: 22100
			                 step: 1 ]
]

{ #category : 'accessing' }
SmoothDelay >> interpolationTime: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]
