"
Pitch shifter for signals with known fundamental frequency. Uses Doppler effect from a continuously ramping delay line, with phase-coherent phasor reset synced to the signal period. Best suited for harmonic/periodic signals like oscillator outputs.

##Parameters:

**freq:** fundamental frequency of the input signal (Hz)
**ratio:** pitch ratio (1.0 = no shift, 2.0 = octave up, 0.5 = octave down)
"
Class {
	#name : 'DopplerShift',
	#superclass : 'PhMonoEffect',
	#instVars : [
		'freq',
		'ratio'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
DopplerShift >> asBox [ 

^ self freq asBox , self ratio asBox , self input asBox connectTo: self code asBox 
]

{ #category : 'accessing' }
DopplerShift >> freq [ 
^ freq 
]

{ #category : 'initialization' }
DopplerShift >> initialize [

	super initialize.
	processExpression := 'process = ef.doppler_shift;'.
	freq := PhHSlider new label: self label , 'Freq' values: #(20 20 5000 1).
	ratio := PhHSlider new label: self label , 'Ratio' values: #(1 0 2 0.01).
]

{ #category : 'accessing' }
DopplerShift >> ratio [

	^ ratio
]
