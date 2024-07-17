"
I am a Phausto tutorial, I will guide you to the world of sound and Digital Signal Processing
"
Class {
	#name : #PhaustoTutorial,
	#superclass : #AbstractTutorial,
	#category : #'Phausto-Tutorial'
}

{ #category : #lessons }
PhaustoTutorial >> helloSine [

	^ Lesson
		  title: 'Sine Waves are cool'
		  lesson: '"at first we create a sine oscillator"
sine := SineOsc new.
"then we create a stereo DSP from our sine oscillator"
dsp := sine asDsp.
"we intialize the DSP - this means we are connecting it witth our audio interface"
dsp init.
"now we can hear the sound"
dsp start.
"and when we are bored, we stop it"
dsp stop.
		
		ProfStef next.
			
			
		
		
		
		'
]

{ #category : #tutorial }
PhaustoTutorial >> tutorial [ 

^ #(#helloSine)
]
