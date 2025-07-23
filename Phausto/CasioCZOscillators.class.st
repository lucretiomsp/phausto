"
Super class for Oscillators that mimic the Casio CZ oscillators.

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
By default, the fund parameter is set to an LFO Saw with controllable frequency

The [Casio CZ](https://en.wikipedia.org/wiki/CasioCZsynthesizers) is a line of synthesizers from the 1980s, known for their unique Phase Distortion synthesis, offering rich, digital tones. Popular for its affordability and distinctive sound, it remains a favorite among vintage synth enthusiasts.


### There are two sets:

- a set with an _index_ parameter
- a set with a _res_ parameter

The _index oscillators_ output a sine wave at index=0 and gets brighter with a higher index. There are two versions of the _index oscillators_:

- with P appended to the name: is phase aligned with fund:sin

- without P appended to the name: has the phase of the original CZ oscillators

The _res oscillator_"" have a resonant frequency. _res_ is the frequency of resonance as a factor of the fundamental pitch.

For the fund waveform, use a low-frequency oscillator without anti-aliasing such as ``LFOSaw```.

#### Parameters:

- **fund**: a saw-tooth waveform between 0 and 1 that the oscillator slaves to.
- **index**: the brightness of the oscillator, 0 to 1. 0 = sine-wave, 1 = saw-wave.
- **res**: the resonance value.

Check subclasses for examples


"
Class {
	#name : 'CasioCZOscillators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'fund',
		'index',
		'res'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
CasioCZOscillators >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	self hasResParameter
		ifTrue: [
		finalBox := self fund asBox, self res asBox connectTo: intermediateBox ]
		ifFalse: [
		finalBox := self fund asBox , self index asBox connectTo: intermediateBox ].
	^ finalBox * self uLevel asBox
]

{ #category : 'accessing' }
CasioCZOscillators >> fund [

	^ fund 
]

{ #category : 'accessing' }
CasioCZOscillators >> hasResParameter [
"check if the class name contains res , hence the Oscillator has the res parameter isntead of the index"
	^ self className includesSubstring: 'res'
]

{ #category : 'accessing' }
CasioCZOscillators >> index [

	^ index 
]

{ #category : 'initialization' }
CasioCZOscillators >> initialize [

	super initialize.
	processExpression := 'process = os.' , self className , ';'.

	res := PhHSlider new
		       label: self label , 'Res'
		       init: 0
		       min: 0
		       max: 8
		       step: 0.001.
	index := PhHSlider new
		         label: self label , 'Index'
		         init: 0
		         min: 0
		         max: 1
		         step: 0.001.
	fund := LFOSaw new freq: (self label , 'Freq') asSymbol.
	self initializeControlParameters .
]

{ #category : 'initialization' }
CasioCZOscillators >> initializeControlParameters [

	| r f ind |
	super initializeControlParameters.

	f := #fund -> (PhControlParameter new
		      label: #fund;
		      description:
			      'A saw-tooth waveform between 0 and 1 that the oscillator slaves to';
		      min: -1; max: 1;
		      value: self fund;
		      widgetType: #knob).
	ind := #index -> (PhControlParameter new
		        label: #index;
		        description:
			        'The brightness of the oscillator, 0 to 1. 0 = sine-wave, 1 = saw-wave';
		        min: -1; max: 1;
		        value: self fund;
		        widgetType: #knob).
	r := #res -> (PhControlParameter new
		      label: #res;
		      description: 'The resonance value';
		       min: -1; max: 1;
		      value: self fund;
		      widgetType: #knob).
	self controlParameters
		add: f;
		add: r;
		add: ind
]

{ #category : 'accessing' }
CasioCZOscillators >> res [

	^ res 
]
