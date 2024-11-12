Class {
	#name : 'PosterSynth',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'initialization' }
PosterSynth >> initialize [ 

| sine env |
sine := SineOsc new freq: (LFOSawPos new freq: LFOSquarePos new ).
env := AREnv new release: 0.4.

^ sine => env.
]
