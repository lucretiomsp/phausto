"
LowFrequencyOScillators are oscillators with no aliasing suppression intended to be used for modulating parameters.
In Phausto all LFOs have 3 instance variables:
freq: set the frequency of the Oscillator
amount: set the multiplier for the Oscillator output 
offset: an offset for the LFO output. 
"
Class {
	#name : #LowFrequencyOscillators,
	#superclass : #Oscillators,
	#instVars : [
		'amount',
		'offset'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #accessing }
LowFrequencyOscillators >> amount [

	^ amount
]

{ #category : #accessing }
LowFrequencyOscillators >> amount: anAmount [

	amount := anAmount asBox
]

{ #category : #initialization }
LowFrequencyOscillators >> initialize [

	super initialize.
	self uLevel: 1.
	self amount: (PhHSlider new
			 label: self label , 'Amount'
			 init: 1
			 min: 0
			 max: 4
			 step: 1).
	self offset: 0.
	self freq: (PhHSlider new
			 label: self label , 'Freq'
			 init: 2
			 min: 0.01
			 max: 20
			 step: 0.001)

	"as LFO are used for modulation, there default level is set to 1"
]

{ #category : #accessing }
LowFrequencyOscillators >> offset [

	^ offset
]

{ #category : #accessing }
LowFrequencyOscillators >> offset: anOffset [

	offset := anOffset asBox
]
