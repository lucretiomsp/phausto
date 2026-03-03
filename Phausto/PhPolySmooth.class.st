"
A smoothing function based on smooth that doesn't smooth when a trigger signal is given. This is very useful when making polyphonic synthesizer to make sure that the value of the parameter is the right one when the note is started.
##Parameters
**gate: the gate/trigger signal used when making polyphonic synths
**s:** the smoothness (see PhSmooth)
**delay:** the number of samples to wait before the signal start being smoothed after g switched to 1

"
Class {
	#name : 'PhPolySmooth',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'gate',
		'delay',
		'smoothness'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'converting' }
PhPolySmooth >> asBox [ 

^ self gate asBox , self smoothness asBox , self delay asBox , self input connectTo: self code asBox
]

{ #category : 'accessing' }
PhPolySmooth >> delay [ 
^ delay 
]

{ #category : 'accessing' }
PhPolySmooth >> gate [ 
^ gate
]

{ #category : 'initialization' }
PhPolySmooth >> initialize [

	super initialize.
	processExpression := 'process = si.polySmooth;'.
	input := #FaderInput asPhHSlider.
	gate := #SmGate asPhButton.
	smoothness := #SmSmoothness asPhHSlider.
	delay := #SmDelay asPhHSlider
]

{ #category : 'accessing' }
PhPolySmooth >> input [ 
^ input
]

{ #category : 'accessing' }
PhPolySmooth >> smoothness [

^ smoothness
]
