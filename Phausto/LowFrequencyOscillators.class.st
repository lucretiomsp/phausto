Class {
	#name : #LowFrequencyOscillators,
	#superclass : #Oscillators,
	#category : #'Phausto-UnitGenerators'
}

{ #category : #initialization }
LowFrequencyOscillators >> initialize [

	super initialize.
	self uLevel: 1.
	self freq: 2
	
	"as LFO are used for modulation, there default level is set to 1"
]
