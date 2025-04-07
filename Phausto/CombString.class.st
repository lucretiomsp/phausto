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
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
CombString >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  asBox , self gain  asBox , self gate asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
CombString >> freq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Note'
			          init: 440
			          min: 20
			          max: 1400
			          step: 0.1 ]
]

{ #category : 'accessing' }
CombString >> gain [

	^ gain 
]

{ #category : 'accessing' }
CombString >> gate [

	^ gate 
]

{ #category : 'initialization' }
CombString >> initialize [

	super initialize.
	processExpression := 'process = sy.popFilterDrum;'.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 20
		        min: 2900
		        max: 1
		        step: 0.01.
	gate := PhButton new label: self label , 'Gate'.
	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.3
		        min: 0
		        max: 1
		        step: 0.001
]
