"
A simple  FM synthesizer with an arbitrary number of modulators connected as a sequence. fm is a standard Faust function.
"
Class {
	#name : 'Fm4Op',
	#superclass : 'Synths',
	#instVars : [
		'carrier',
		'modulator1',
		'modulator2',
		'modulator3'
	],
	#category : 'Phausto-BoxAPI-Synths',
	#package : 'Phausto',
	#tag : 'BoxAPI-Synths'
}

{ #category : 'initialization' }
Fm4Op >> initialize [

	super initialize.
	self initializeOscillators.
	^ carrier 
]

{ #category : 'initialization' }
Fm4Op >> initializeOscillators [

	| carrierFreq freqValues indexValues modulator2Freq modulator1Freq indexSliders |
	freqValues := #( 50 1 900 1 ).
	indexValues := #( 0 0 200 0.01 ).
	indexSliders := #( 'Mod3Index' 'Mod2Index' 'Mod1Index' ) collect: [
		                :l | PhHSlider new label: l values: indexValues ].
    

	"the last modulator has no modulator"
	modulator3 := SineOsc new
		              freq: #Mod3Freq;
		              uLevel: (indexSliders at: 1).
	modulator2Freq := modulator3
	                  +
	                  (PhHSlider new label: 'Mod2Freq' values: freqValues).
	modulator2 := SineOsc new
		              freq: modulator2Freq;
		              uLevel: (indexSliders at: 2).
	modulator1Freq := modulator2
	                  +
	                  (PhHSlider new label: 'Mod1Freq' values: freqValues).
	modulator1 := SineOsc new
		              freq: modulator1Freq;
		              uLevel: (indexSliders at: 3).
	carrierFreq := modulator1
	               +
	               (PhHSlider new label: 'CarrierFreq' values: freqValues).

	carrier := SineOsc new
		           freq: carrierFreq;
		           uLevel: #CarrierLevel
]
