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

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self pan , self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Panner >> initialize [

	super initialize.
	processExpression :='process = sp.panner;'.
	
	
]
