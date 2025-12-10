"
Demo of a parametric equalizer.
A parametric equalizer is an audio processing tool that allows precise control over specific frequency ranges by adjusting their gain, frequency, and bandwidth (Q factor), enabling detailed sound shaping and correction.
"
Class {
	#name : 'Parametric_Eq_Demo',
	#superclass : 'PhDemosMono',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'as yet unclassified' }
Parametric_Eq_Demo >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self input asBox connectTo: intermediateBox .

	^ finalBox
]
