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
		'distortion'
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

	| saw square trigger baseFreq oscillator volume filterEnv filter ampEnv instrument envAmount filterDecay |
	volume := PhHSlider new
		          label: self label , 'Volume'
		          init: 0.5
		          min: 0
		          max: 1
		          step: 0.01.
	envMod := PhHSlider new
		          label: self label , 'EnvMod'
		          init: 0
		          min: 0
		          max: 1
		          step: 0.001.
	baseFreq := PhHSlider new
		            label: self label , 'Note'
		            init: 440
		            min: 20
		            max: 2000
		            step: 1.
	trigger := PhButton new label: self label , 'Gate'.

	filterDecay := PhHSlider new
		               label: 'FilterEnvDecay'
		               init: 0.2
		               min: 0.01
		               max: 2
		               step: 0.001.
	filterEnv := AREnv new
		             trigger: trigger;
		             attack: 0.001 asBox;
		release: filterDecay .
	ampEnv := AREnv new
		          trigger: trigger;
		          attack: 0.001 asBox;
		          release: 0.2 asBox.

	envAmount := filterEnv * (1 asBox - self cutoffFreq * envMod asBox).

	compensation := 1 asBox / (0.5 asBox  + self cutoffFreq).
	filter := Korg35LPF new
		          fr:  envAmount + self cutoffFreq;
		          res: self resonance.
	saw := SawOsc new
		       uLevel: volume;
		       freq: baseFreq + self tuning.
	square := SquareOsc new
		          uLevel: volume;
		          freq: baseFreq + self tuning.
	oscillator := Select2 new
		              label: self label , 'Waveform';
		              input0: saw;
		              input1: square.

	distortion := Cubic1 new.
	instrument := oscillator * ampEnv => filter * self resonance
	              * compensation => distortion.
	^ instrument asBox
]

{ #category : 'accessing' }
Acid >> cutoffFreq [

	^ cutoffFreq ifNil: [
		  PhHSlider new
			  label: self label , 'CutoffFreq'
			  init: 1
			  min: 0.2
			  max: 1
			  step: 0.001 ]
]

{ #category : 'accessing' }
Acid >> envMod [

	^ envMod ifNil: [
		  PhHSlider new
			  label: self label , 'EnvMod'
			  init: 0.5
			  min: 0.1
			  max: 1
			  step: 0.001 ]
]

{ #category : 'initialization' }
Acid >> initialize [

	super initialize.
	self resonance: #(1 1 9 0.001)
]

{ #category : 'accessing' }
Acid >> resonance [

	^ resonance ifNil: [
		  PhHSlider new
			  label: self label , 'Resonance'
			  init: 0.5
			  min: 0.001
			  max: 20
			  step: 0.001 ]
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
