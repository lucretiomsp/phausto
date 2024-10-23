"
Simple resonant filters based on tf2s (virtual analog).
Subclasses include lowpass, highpass, bandpass.
"
Class {
	#name : 'ResonatorFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'q',
		'frequency',
		'gain'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
ResonatorFilter >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self frequency , self q , self gain , self input
		            connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
ResonatorFilter >> frequency [

	^ frequency ifNil: [  frequency := (PhHSlider new
			 label: 'Cutoff'
			 init: 19000
			 min: 20
			 max: 19999
			 step: 1). ]
]

{ #category : 'accessing' }
ResonatorFilter >> frequency: aNumberOrABox [
"center frequency in Hertz"
	frequency := aNumberOrABox asBox.
]

{ #category : 'accessing' }
ResonatorFilter >> gain [

	^ gain ifNil: [  gain := 1 ]
]

{ #category : 'accessing' }
ResonatorFilter >> gain: aNumberOrABox [

	gain := aNumberOrABox asBox
]

{ #category : 'initialization' }
ResonatorFilter >> initialize [

	super initialize.
	

]

{ #category : 'accessing' }
ResonatorFilter >> input [

	^ input ifNil: [ input := 0 ]
]

{ #category : 'accessing' }
ResonatorFilter >> input: anInput [
"audio input"
	input := anInput asBox
]

{ #category : 'accessing - input' }
ResonatorFilter >> patchedWith: anInput [

self input: anInput
]

{ #category : 'accessing' }
ResonatorFilter >> q [

	^ q ifNil: [ q := (PhHSlider new
			 label:  'Resonance'
			 init: 1
			 min: 0.1
			 max: 24
			 step: 0.01). ]
]

{ #category : 'accessing' }
ResonatorFilter >> q: aNumberOrABox [
"q(uality) of the filter - higher values for higher resonance"
	q := aNumberOrABox asBox
]
