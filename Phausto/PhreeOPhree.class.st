"
PhreeOPhree is the Phausto clone of the Roland TB-303.
The Roland TB-303 is a monophonic bass synthesizer from the early 1980s, known for its squelchy, resonant sound, used extensively in acid house music. Iconic tracks like ""Acid Tracks"" by Phuture and ""Voodoo Ray"" by A Guy Called Gerald showcase its signature filter sweeps and basslines.
"
Class {
	#name : 'PhreeOPhree',
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
PhreeOPhree >> accent [

	^ accent ifNil: [
		  PhHSlider new
			  label: self label , 'Accent'
			  init: 0.5
			  min: 0
			  max: 1
			  step: 0.001 ]
]

{ #category : 'accessing' }
PhreeOPhree >> accent: anObject [

	accent := anObject
]

{ #category : 'accessing' }
PhreeOPhree >> cutoffFreq [

	^ cutoffFreq ifNil: [
		  PhHSlider new
			  label: self label , 'cutoffFreq'
			  init: 800
			  min: 300
			  max: 300
			  step: 1 ]
]

{ #category : 'accessing' }
PhreeOPhree >> cutoffFreq: anObject [

	cutoffFreq := anObject
]

{ #category : 'accessing' }
PhreeOPhree >> envMod [

	^ envMod  ifNil: [
		  PhHSlider new
			  label: self label , 'EnvMod'
			  init: 0.5
			  min: 0.001
			  max: 1
			  step: 0.001 ]
]

{ #category : 'accessing' }
PhreeOPhree >> envMod: anObject [

	envMod := anObject
]

{ #category : 'accessing' }
PhreeOPhree >> resonance [

	^ resonance
]

{ #category : 'accessing' }
PhreeOPhree >> resonance: anObject [

	resonance := anObject
]

{ #category : 'accessing' }
PhreeOPhree >> tuning [

	^ tuning ifNil: [
		  PhHSlider new
			  label: self label , 'Tuning'
			  init: 0
			  min: -100
			  max: 100
			  step: 1 ]
]

{ #category : 'accessing' }
PhreeOPhree >> tuning: anObject [

	tuning := anObject
]

{ #category : 'accessing' }
PhreeOPhree >> waveform [

	^ waveform  ifNil: [
		  PhButton new label: self label , 'Waveform' ]
]

{ #category : 'accessing' }
PhreeOPhree >> waveform: anObject [

	waveform := anObject
]
