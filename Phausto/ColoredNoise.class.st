"
# Colored Noise
Generates a colored noise signal with an arbitrary spectral roll-off factor (alpha) over the entire audible frequency range (20-20000 Hz). The output is normalized so that an equal RMS level is maintained for different values of alpha.
Use a small N (e.g., 4–8) for faster computation.
If you want a smoother or more realistic spectral shape, increase N (e.g., 16–64), by changing the value of the class side method.""

## Parameters:
**alpha**: slope of roll-off, between -1 and 1. -1 corresponds to brown/red noise, -1/2 pink noise, 0 white noise, 1/2 blue noise, and 1 violet/azure noise.
"
Class {
	#name : 'ColoredNoise',
	#superclass : 'UnitGenerator',
	#instVars : [
		'alpha'
	],
	#category : 'Phausto-Noises',
	#package : 'Phausto',
	#tag : 'Noises'
}

{ #category : 'keys - letters' }
ColoredNoise class >> n [

^ 8
]

{ #category : 'accessing' }
ColoredNoise >> alpha [

	^ alpha
]

{ #category : 'converting' }
ColoredNoise >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self alpha asBox connectTo: intermediateBox.
	^ finalBox * self uLevel asBox
]

{ #category : 'initialization' }
ColoredNoise >> initialize [

	super initialize.
	processExpression := 'process = no.colored_noise(8);'.
	alpha := PhVSlider new label: self label , 'Alpha' values: #( 0 -1 1 0.25 )
]
