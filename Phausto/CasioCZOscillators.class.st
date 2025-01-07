"
Super class for Oscillators that mimic the Casio CZ oscillators. 
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

und: a saw-tooth waveform between 0 and 1 that the oscillator slaves to
index: the brightness of the oscillator, 0 to 1. 0 = sine-wave, 1 = saw-wave

"
Class {
	#name : 'CasioCZOscillators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'fund',
		'index'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
CasioCZOscillators >> fund [

	^ fund ifNil: [
		  PhHSlider new
			  label: self label , 'Fund'
			  init: 0
			  min: 0
			  max: 1
			  step: 0.001 ]
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
