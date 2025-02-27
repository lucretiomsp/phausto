"
#LowFrequencyOscillators with range -1,1. 

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
No Aliasing suppression. 
They can also have freq > 20 Hz, so they can work at _audio rate_.
[Low Frequency Oscillators](https://en.wikipedia.org/wiki/Low-frequency_oscillation	) are used to modulate synthesisers and effects parameters
"
Class {
	#name : 'LFO',
	#superclass : 'Oscillator',
	#instVars : [
		'amount',
		'offset'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
LFO >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq connectTo: intermediateBox.
	^ finalBox 
]

{ #category : 'accessing' }
LFO >> freq [

	^ freq ifNil: [
		  PhHSlider new
			  label: self label , 'Freq'
			  init: 2
			  min: 0.01
			  max: 20
			  step: 0.01 ]
]

{ #category : 'initialization' }
LFO >> initialize [

	super initialize.
	"as LFO are used for modulation, there default level is set to 1"
	self uLevel: 1.
	


	
]
