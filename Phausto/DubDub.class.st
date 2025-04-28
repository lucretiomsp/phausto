"
A simple synth based on a sawtooth wave filtered by a resonant lowpass. dubDub is a standard Faust function.



- **freq**: frequency of the sawtooth in Hz
- **ctFreq**: cutoff frequency of the filter
- **q**: Q of the filter
- **gate**: the trigger signal (0 or 1)

```language=Pharo
""DubDub is ready to played, just need to be transformed into a DSP""
dsp := DubDub new stereo asDsp.
dsp init.
dsp start.
dsp displayUI.
dsp stop.
```
"
Class {
	#name : 'DubDub',
	#superclass : 'Synths',
	#instVars : [
		'freq',
		'ctFreq',
		'q',
		'gate'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
DubDub >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self ctFreq , self q asBox
	            , self gate asBox connectTo: intermediateBox.
	^ finalBox *  self uLevel
]

{ #category : 'as yet unclassified' }
DubDub >> ctFreq [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'CtFreq'
			          init: 50
			          min: 20
			          max: 1400
			          step: 0.1 ]
]

{ #category : 'accessing' }
DubDub >> freq [

	^ freq 
]

{ #category : 'accessing' }
DubDub >> gate [

	^ gate 
]

{ #category : 'initialization' }
DubDub >> initialize [

	super initialize.
	processExpression := 'process = sy.dubDub;'.
	freq := PhHSlider new
		        label: self label , 'Note'
		        init: 50
		        min: 20
		        max: 1400
		        step: 0.1.

	self controlParameters add: #freq -> (self freq
			 asControlParameterOfWidgetType: #knob
			 description: 'Frequency in Hertz').
	uLevel := PhHSlider new
		          label: self label , 'uLevel'
		          init: 0.05
		          min: 0
		          max: 1
		          step: 0.001.
		gate := PhButton new label: self label , 'Gate'.
		self controlParameters add: #gate -> (self gate asControlParameterOfWidgetType: #button description: 'Trig the Sund').
]

{ #category : 'as yet unclassified' }
DubDub >> q [

	^ freq ifNil: [
		  freq := PhHSlider new
			          label: self label , 'Q'
			          init: 3
			          min: 1
			          max: 12
			          step: 0.1 ]
]
