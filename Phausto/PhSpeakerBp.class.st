"
Dirt-simple speaker simulator (overall bandpass eq with observed roll-offs above and below the passband). 

Low-frequency speaker model = +12 dB/octave slope breaking to flat near f1. Implemented using two dc blockers in series.
High-frequency model = -24 dB/octave slope implemented using a fourth-order Butterworth lowpass.

##Parameters:
**f1:** low frequency.
**f2:** high frequency.
"
Class {
	#name : 'PhSpeakerBp',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'f1',
		'f2'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
PhSpeakerBp >> asBox [

	^ self f1 asBox , self f2 asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhSpeakerBp >> f1 [

^ f1
]

{ #category : 'accessing' }
PhSpeakerBp >> f2 [

	^ f2
]

{ #category : 'initialization' }
PhSpeakerBp >> initialize [

	super initialize.
	processExpression := 'process = ef.speakerbp;'.
	f1 := PhHSlider new label: self label , 'F1' values: #(100 20 2000 1).
	f2 := PhHSlider new label: self label , 'F2' values: #(3000 3000 8000 1).
]
