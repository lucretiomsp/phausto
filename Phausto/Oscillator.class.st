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
	#name : 'Oscillator',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'accessing' }
Oscillator >> freq [

	^ freq 
]

{ #category : 'initialization' }
Oscillator >> initialize [

	super initialize.
	"default frequency for all Oscilators is a slider initialized at A4 / picth standard"
	freq := PhHSlider new
			  label: self label , 'Freq'
			  init: 440
			  min: 20
			  max: 4086
			  step: 1 
]

{ #category : 'initialization' }
Oscillator >> initializeControlParameters [

	super initializeControlParameters.

	self controlParameters add:
		#freq -> ((PhControlParameter  new name: #freq; description: 'Controls the frequency of the Oscillator in Hertz'; range: (1 to: 4186); value: self freq; widgetType: #knob))
]
