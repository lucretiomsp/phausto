"
Nth-order Butterworth lowpass filter
A low-pass filter is a filter that passes signals with a frequency lower than a selected cutoff frequency and attenuates signals with frequencies higher than the cutoff frequency. The exact frequency response of the filter depends on the filter design.

By Default, Phausto Butterworth LowPass is a 4 pole filters with a default cutoff frequency at 8000 hz
@see https://en.wikipedia.org/wiki/Low-pass_filter
(https://ccrma.stanford.edu/~jos/filters/Butterworth_Lowpass_Design.html)
"
Class {
	#name : 'Lowpass',
	#superclass : 'ButterworthLPHP',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
Lowpass >> asBox [

	| intermdiateBox finalBox |
	

	intermdiateBox := super asBox .

	finalBox := self cutoff , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
Lowpass >> initialize [

	super initialize.
	self processExpression: 'process = fi.lowpass(4);'.

]

{ #category : 'connecting' }
Lowpass >> patchedWith: aUnitGenerator [

self  input: aUnitGenerator asBox
]
