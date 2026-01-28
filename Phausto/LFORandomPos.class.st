"
LowFrequencyOscillator with random positive values
"
Class {
	#name : 'LFORandomPos',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
LFORandomPos >> asBox [

	| sampleAndHold finalBox |
	sampleAndHold := PhSampleAndHold new
		                 input: Noise new;
		                 trig: (Pulsen new
				                  length: (1 / 44100) asBox;
				                  period: (1 asBox / self freq) asBox).
	finalBox := (sampleAndHold absolute  * self amount) + self offset.
	^ finalBox
]
