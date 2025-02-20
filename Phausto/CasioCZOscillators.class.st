"
Super class for Oscillators that mimic the Casio CZ oscillators.
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
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'converting' }
CasioCZOscillators >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	self hasResParameter ifTrue: [ finalBox := self fund , self res connectTo: intermediateBox ] ifFalse:
	[finalBox := self fund , self index connectTo: intermediateBox].
	^ finalBox * self uLevel
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
		fund := LFOSaw new freq: (self class , 'Freq') asSymbol
]

{ #category : 'accessing' }
CasioCZOscillators >> res [

	^ res 
]
