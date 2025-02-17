"
This class contains a collection of Oscllators taken from the Faust [oscillators.lib](https://faustlibraries.grame.fr/libs/oscillators/). This collection includes:
- WaveTable Based Oscillators;
- Low Frequency Oscillators;
- Alias Suppressed Oscillators;
- Filter Based Oscillators;
- Waveguide REsonator Based Oscillators;
- Casio CZ Oscillator;
- Poly BLEP Based Oscillatora
"
Class {
	#name : 'Oscillators',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'accessing' }
Oscillators >> freq [

	^ freq 
]

{ #category : 'initialization' }
Oscillators >> initialize [

	super initialize.
	"default frequency for all Oscilators is a slider initialized at A4 / picth standard"
	freq := PhHSlider new
			  label: self label , 'Freq'
			  init: 440
			  min: 20
			  max: 4086
			  step: 1 
]
