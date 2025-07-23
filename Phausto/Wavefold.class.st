"
Wavefolding is a type of distortion synthesis that alters the shape of a waveform, creating complex spectra from simple tones. It is a form of waveshaping, where the signal is folded back on itself, inverting the waveform and generating a series of peaks and valleys.

Mechanism

Wavefolding works by applying a threshold to the input signal, inverting the waveform when it exceeds this threshold. This process can be repeated multiple times, resulting in a highly complex and evolving timbre. The threshold can be modulated by audio signals, allowing for dynamic control over the distortion.

Here, width, is the width of the folded sectionof the folded section [0..1] (float).
"
Class {
	#name : 'Wavefold',
	#superclass : 'Saturators',
	#instVars : [
		'width'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
Wavefold >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self width asBox , self input asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Wavefold >> initialize [

	super initialize.
	processExpression :='process = ef.wavefold;'.
	
	
]

{ #category : 'as yet unclassified' }
Wavefold >> width [

	^ width ifNil: [   PhHSlider new
		        label: self label , 'Width'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001 ]
]

{ #category : 'as yet unclassified' }
Wavefold >> width: aNumberOrABox [


	width := aNumberOrABox isNumber
		        ifTrue: [ self width init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ].

]
