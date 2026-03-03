"
A smoothing function based on smooth that holds its output signal when a trigger is sent to it. This feature is convenient when implementing polyphonic instruments to prevent some smoothed parameter to change when a note-off event is sent.
##Parameters:
**gate:** the hold signal (0 for hold, 1 for bypass)
*smoothness:** the smoothness (see smooth)
"
Class {
	#name : 'PhSmoothAndH',
	#superclass : 'PhSmoo',
	#instVars : [
		'gate',
		'smoothness'
	],
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'initialization' }
PhSmoothAndH >> asBox [

	^ self gate asBox , self smoothness asBox 
	  , self input connectTo: self code asBox
]

{ #category : 'accessing' }
PhSmoothAndH >> gate [ 
^ gate
]

{ #category : 'initialization' }
PhSmoothAndH >> initialize [

	super initialize.
	processExpression := 'process = si.smoothAndH;'.

	gate := #SmGate asPhButton.
	smoothness := #SmSmoothness asPhHSlider
]

{ #category : 'accessing' }
PhSmoothAndH >> smoothness [ 
^ smoothness
]
