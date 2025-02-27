"
LFOForModulation are oscillators with no aliasing suppression intended to be used for modulating parameters, with positive range.

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**

## Parameters
- **freq**: set the frequency of the Oscillator
- **amount**: set the multiplier for the Oscillator output 
- **offset**: an offset for the LFO output. 

## Example:
```language=Pharo
""A Sawtooth LFO modulating the frequency of a SineOsc between 20 and 200 Hz""
modulator := LFOSawPos new offset: 20; amount: 200.
s := SineOsc new freq: modulator.
dsp := s stereo asDsp.
dsp init.
dsp start.
dsp stop.
```
#### If you want to use _standard_ LFOs with range -1, 1 please use subclasses of `LFO`.
"
Class {
	#name : 'LFOForModulation',
	#superclass : 'Oscillator',
	#instVars : [
		'amount',
		'offset'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'as yet unclassified' }
LFOForModulation >> amount [

	^ amount ifNil: [
		  amount := PhHSlider new
			            label: self label , 'Amount'
			            init: 400
			            min: 0
			            max: 8000
			            step: 1 ]
]

{ #category : 'converting' }
LFOForModulation >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq  connectTo: intermediateBox.
	^ finalBox * self amount asBox + self offset asBox
]

{ #category : 'accessing' }
LFOForModulation >> freq [

	^ freq ifNil: [
		  PhHSlider new
			  label: self label , 'Freq'
			  init: 2
			  min: 0.01
			  max: 20
			  step: 0.01 ]
]

{ #category : 'initialization' }
LFOForModulation >> initialize [

	super initialize.
	"as LFO are used for modulation, there default level is set to 1"
	self uLevel: 1.
	"default frequency for all Oscilators is a slider iranged 0.1 - 20 Hz initialized at: 1"
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 1
		        min: 0.1
		        max: 20
		        step: 0.1
]

{ #category : 'as yet unclassified' }
LFOForModulation >> offset [

	^ offset ifNil: [  	offset := PhHSlider new
		          label: self label , 'Offset'
		          init: 0
		          min: 0
		          max: 800
		          step: 0.01. ]
]
