"
Simplest string physical model ever based on a comb filter. combString is a standard Faust function.


## Parameters
- **freq**: the frequency of the string in Hz
- **res**: string T60 (resonance time) in second
- **gate**: trigger signal (0 or 1)

### Example
```language=Pharo
""CombString is ready to played, just need to be transformed into a DSP""
dsp := CombString new stereo asDsp.
dsp init.
dsp start.
dsp displayUI.
dsp stop.
```
"
Class {
	#name : 'CombString',
	#superclass : 'Synths',
	#instVars : [
		'freq',
		'gain',
		'gate',
		'res'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
CombString >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self res asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox *  self uLevel
]

{ #category : 'accessing' }
CombString >> freq [

	^ freq 
]

{ #category : 'accessing' }
CombString >> gate [

	^ gate
]

{ #category : 'initialization' }
CombString >> initialize [

	super initialize.
	processExpression := 'process = sy.combString;'.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 20
		        min: 2900
		        max: 1
		        step: 0.01.

	self controlParameters add: #freq -> (self freq
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').
	gate := PhButton new label: self label , 'Gate'.
	res := PhHSlider new
		       label: self label , 'Res'
		       init: 0.3
		       min: 0
		       max: 1
		       step: 0.001
]

{ #category : 'accessing' }
CombString >> res [

	^ res
]
