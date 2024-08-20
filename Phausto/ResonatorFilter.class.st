"
Simple resonant filters based on tf2s (virtual analog).
Subclasses include lowpass, highpass, bandpass.
"
Class {
	#name : 'ResonatorFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'input',
		'q',
		'frequency',
		'gain'
	],
	#category : 'Phausto-BoxAPI-Filters',
	#package : 'Phausto',
	#tag : 'BoxAPI-Filters'
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

	^ frequency
]

{ #category : 'accessing' }
ResonatorFilter >> frequency: aNumberOrABox [
"center frequency in Hertz"
	frequency := aNumberOrABox asBox.
]

{ #category : 'accessing' }
ResonatorFilter >> gain [

	^ gain
]

{ #category : 'accessing' }
ResonatorFilter >> gain: aNumberOrABox [

	gain := aNumberOrABox asBox
]

{ #category : 'initialization' }
ResonatorFilter >> initialize [

	super initialize.
	self frequency: (PhHSlider new
			 label: 'MasterCutoff'
			 init: 19000
			 min: 20
			 max: 19999
			 step: 1).
	self q: (PhHSlider new
			 label:  'Resonance'
			 init: 1
			 min: 0.1
			 max: 1
			 step: 0.01).
	self gain: 1.
	self input: 0
]

{ #category : 'accessing' }
ResonatorFilter >> input [

	^ input
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

	^ q
]

{ #category : 'accessing' }
ResonatorFilter >> q: aNumberOrABox [
"q(uality) of the filter - higher values for higher resonance"
	q := aNumberOrABox asBox
]
