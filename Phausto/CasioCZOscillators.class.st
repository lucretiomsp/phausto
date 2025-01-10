"
Super class for Oscillators that mimic the Casio CZ oscillators. 
By default, the fund parameter is set to an LFO Saw with controllable frequency

The Casio CZ is a line of synthesizers from the 1980s, known for their unique Phase Distortion synthesis, offering rich, digital tones. Popular for its affordability and distinctive sound, it remains a favorite among vintage synth enthusiasts. 
https://en.wikipedia.org/wiki/Casio_CZ_synthesizers

There are two sets:

a set with an index parameter
a set with a res parameter

The ""index oscillators"" outputs a sine wave at index=0 and gets brighter with a higher index. There are two versions of the ""index oscillators"":

with P appended to the name: is phase aligned with fund:sin

without P appended to the name: has the phase of the original CZ oscillators

The ""res oscillators"" have a resonant frequency. ""res"" is the frequency of resonance as a factor of the fundamental pitch.

For the fund waveform, use a low-frequency oscillator without anti-aliasing such as os.lf_saw.


Parameters:f

fund: a saw-tooth waveform between 0 and 1 that the oscillator slaves to
index: the brightness of the oscillator, 0 to 1. 0 = sine-wave, 1 = saw-wave
res: the resonance value

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

	^ fund ifNil: [
		  LFOSaw new freq: (self class , 'Freq') asSymbol ]
]

{ #category : 'accessing' }
CasioCZOscillators >> hasResParameter [
"check if the class name contains res , hence the Oscillator has the res parameter isntead of the index"
	^ self className includesSubstring: 'res'
]

{ #category : 'accessing' }
CasioCZOscillators >> index [

	^ index ifNil: [
		  PhHSlider new
			  label: self label , 'Index'
			  init: 0
			  min: 0
			  max: 1
			  step: 0.001 ]
]

{ #category : 'initialization' }
CasioCZOscillators >> initialize [

	super initialize.
	processExpression := 'process = os.' , self className , ';'
]

{ #category : 'accessing' }
CasioCZOscillators >> res [

	^ res ifNil: [
		  PhHSlider new
			  label: self label , 'Res'
			  init: 0
			  min: 0
			  max: 8
			  step: 0.001 ]
]
