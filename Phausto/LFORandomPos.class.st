"
LowFrequencyOscillator with random positive values
"
Class {
	#name : 'LFORandomPos',
	#superclass : 'LowFrequencyOscillators',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
LFORandomPos >> asBox [

	| sampleAndHold finalBox |
	sampleAndHold := SampleAndHold new
		                 input: Noise new;
		                 trig: (Pulsen new
				                  length: 1 / 44100;
				                  period: 1 asBox / self freq).
	finalBox := sampleAndHold absolute + self offset * self amount.
	^ finalBox
]
