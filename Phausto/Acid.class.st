"
Acid is the Phausto clone of the Roland TB-303.
The Roland TB-303 is a monophonic bass synthesizer from the early 1980s, known for its squelchy, resonant sound, used extensively in acid house music. Iconic tracks like ""Acid Tracks"" by Phuture and ""Voodoo Ray"" by A Guy Called Gerald showcase its signature filter sweeps and basslines.
"
Class {
	#name : 'Acid',
	#superclass : 'TpSynth',
	#instVars : [
		'tuning',
		'cutoffFreq',
		'resonance',
		'envMod',
		'accent',
		'waveform'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
Acid >> accent [

	^ accent ifNil: [
		  PhHSlider new
			  label: self label , 'Accent'
			  init: 0.5
			  min: 0
			  max: 1
			  step: 0.001 ]
]

{ #category : 'initialization' }
Acid >> asBox [

	| saw square oscillator volume filter ampEnv filterEnv instrument |
	volume := PhHSlider new
		          label: self label , 'Volume'
		          init: 0.5
		          min: 0
		          max: 1
		          step: 0.01.
	filter := ResonLp new.
	saw := SawOsc new uLevel: volume.
	square := SquareOsc new uLevel: volume.
	oscillator := Select2 new
		              label: self label , 'Waveform';
		              input0: saw;
		              input1: square.

	instrument := oscillator => filter.
	^ instrument asBox
]

{ #category : 'accessing' }
Acid >> cutoffFreq [

	^ cutoffFreq ifNil: [
		  PhHSlider new
			  label: self label , 'cutoffFreq'
			  init: 800
			  min: 300
			  max: 300
			  step: 1 ]
]

{ #category : 'accessing' }
Acid >> envMod [

	^ envMod  ifNil: [
		  PhHSlider new
			  label: self label , 'EnvMod'
			  init: 0.5
			  min: 0.001
			  max: 1
			  step: 0.001 ]
]

{ #category : 'initialization' }
Acid >> initialize [ 

super initialize 
]

{ #category : 'accessing' }
Acid >> resonance [

	^ resonance
]

{ #category : 'accessing' }
Acid >> tuning [

	^ tuning ifNil: [
		  PhHSlider new
			  label: self label , 'Tuning'
			  init: 0
			  min: -100
			  max: 100
			  step: 1 ]
]

{ #category : 'accessing' }
Acid >> waveform [

	^ waveform  ifNil: [
		  PhButton new label: self label , 'Waveform' ]
]
