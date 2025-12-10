"
Clap synthesis through filtered white noise.


## Parameters:

- **tone**: bandpass filter cutoff frequency, tuned for [400Hz, 3500Hz]
- **attack**: attack time in seconds, tuned for [0s, 0.2s]
- **decay**: decay time in seconds, tuned for [0s, 4.0s]
- **gate**: the gate which triggers the amp envelope

## Example


```language=Pharo
""Clap is ready to played, just need to be transformed into a DSP""
dsp := Clap new stereo asDsp.
dsp init.
dsp start.
dsp displayUI.
dsp stop.
```


"
Class {
	#name : 'Clap',
	#superclass : 'Synths',
	#instVars : [
		'tone',
		'attack',
		'decay'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'converting' }
Clap >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self tone asBox , self attack asBox , self decay asBox
	            , self gate asBox connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'accessing' }
Clap >> attack [

^ attack
]

{ #category : 'accessing' }
Clap >> decay [

	^ decay 
]

{ #category : 'initialization' }
Clap >> initialize [

	super initialize.
	self processExpression: 'process = sy.clap;'.

	attack := 0.

	decay := PhHSlider new
		         label: self label , 'Decay'
		         init: 0.9
		         min: 0
		         max: 4.0
		         step: 0.01.
	tone := PhHSlider new
		        label: self label , 'Freq'
		        init: 3200
		        min: 400
		        max: 3500
		        step: 1.
	uLevel := PhHSlider new
		          label: self label , 'uLevel'
		          init: 0.4
		          min: 0
		          max: 1
		          step: 0.001.

	self controlParameters add: #tone -> (self tone asControlParameterOfWidgetType: #knob description: 'Filter Frequency')
]

{ #category : 'accessing' }
Clap >> tone [

	^ tone
]
