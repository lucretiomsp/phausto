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
		'waveform',
		'compensation',
		'distortion',
		'filterDecay'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'accessing' }
Acid >> accent [

	^ accent 
]

{ #category : 'initialization' }
Acid >> asBox [

	| saw square baseFreq oscillator filterEnv filter ampEnv instrument envAmount |
	baseFreq := PhHSlider new
		            label: self label , 'Note'
		            init: 440
		            min: 20
		            max: 2000
		            step: 1.



	filterEnv := AREnv new
		             trigger: #acidGate;
		             attack: 0.001 asBox;
		             release: self filterDecay.
	ampEnv := AREnv new
		          trigger: #acidGate;
		          attack: 0.001 asBox;
		          release: 0.2 asBox.

	envAmount := filterEnv * (1 asBox - self cutoffFreq * envMod asBox).

	compensation := 1 asBox / (0.5 asBox + self cutoffFreq).
	filter := Korg35LPF new
		          fr: envAmount + self cutoffFreq;
		          res: self resonance.
	saw := SawOsc new
		       uLevel: self uLevel * 0.25 asBox;
		       freq: baseFreq + self tuning.
	square := SquareOsc new
		          uLevel: self uLevel * 0.25 asBox;
		          freq: baseFreq + self tuning.
	oscillator := Select2 new
		              label: self label , 'Waveform';
		              input0: saw;
		              input1: square.

	distortion := Cubic1 new.
	instrument := oscillator * ampEnv => filter * compensation
	              => distortion.
	^ instrument asBox
]

{ #category : 'accessing' }
Acid >> cutoffFreq [

	^ cutoffFreq 
]

{ #category : 'accessing' }
Acid >> envMod [

	^ envMod 
]

{ #category : 'accessing' }
Acid >> filterDecay [

	^ filterDecay
]

{ #category : 'initialization' }
Acid >> initialize [

	super initialize.
	resonance := PhHSlider new
		             label: self label , 'Resonance'
		             init: 4.5
		             min: 1
		             max: 7
		             step: 0.001.

	level := PhHSlider new
		          label: self label , 'uLevel'
		          init: 0.5
		          min: 0
		          max: 1
		          step: 0.01.
	cutoffFreq := PhHSlider new
		              label: self label , 'CutoffFreq'
		              init: 0.3
		              min: 0.2
		              max: 1
		              step: 0.001.

	envMod := PhHSlider new
		          label: self label , 'EnvMod'
		          init: 0.64
		          min: 0.1
		          max: 1
		          step: 0.001.
	tuning := PhHSlider new
		          label: self label , 'Tuning'
		          init: 0
		          min: -100
		          max: 100
		          step: 1.
	waveform := PhButton new label: self label , 'Waveform'.
	trigger := PhButton new label: self label , 'Gate'.
	accent := PhHSlider new
		          label: self label , 'Accent'
		          init: 0.6
		          min: 0
		          max: 1
		          step: 0.001.
	filterDecay := PhHSlider new
		               label: self label , 'EnvDecay'
		               init: 0.282
		               min: 0.01
		               max: 2
		               step: 0.001
]

{ #category : 'accessing' }
Acid >> resonance [

	^ resonance 
]

{ #category : 'accessing' }
Acid >> tuning [

	^ tuning
]

{ #category : 'accessing' }
Acid >> uLevel [

	^ uLevel
]

{ #category : 'accessing' }
Acid >> waveform [

	^ waveform 
]
