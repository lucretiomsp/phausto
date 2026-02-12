"
A simple linear stereo panner. 

pan = 0 means hard left, 0.5 is the middle, 1 for hard right
"
Class {
	#name : 'Panner',
	#superclass : 'Spatials',
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Panner >> asBox [

^ self pan asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
Panner >> initialize [

	super initialize.
	processExpression := 'process = sp.panner;'.
	pan := PhHSlider new
		       label: self label , 'Pan'
		       init: 0.5
		       min: 0
		       max: 1
		       step: 0.001
]
