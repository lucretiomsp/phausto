Class {
	#name : #LFORandomPos,
	#superclass : #LowFrequencyOscillators,
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
LFORandomPos >> asBox [

	| sampleAndHold finalBox |
	sampleAndHold := SampleAndHold new
		                 input: Noise new;
		                 trig: (Pulsen new period: 1 asBox / self freq).
	finalBox := (sampleAndHold absolute + self offset) * self amount.
	^ finalBox
]
