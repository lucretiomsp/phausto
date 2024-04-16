"
Nth-order Butterworth lowpass filter
A low-pass filter is a filter that passes signals with a frequency lower than a selected cutoff frequency and attenuates signals with frequencies higher than the cutoff frequency. The exact frequency response of the filter depends on the filter design.

By Default, Phausto Butterworth LowPass is a 4 pole filters with a default cutoff frequency at 8000 hz
@see https://en.wikipedia.org/wiki/Low-pass_filter
(https://ccrma.stanford.edu/~jos/filters/Butterworth_Lowpass_Design.html)
"
Class {
	#name : #Lowpass,
	#superclass : #ButterworthLPHP,
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #converting }
Lowpass >> asBox [

	| intermdiateBox finalBox code |
	code := 'import("stdfaust.lib"); process = fi.lowpass(4);'.

	intermdiateBox := BoxAPI uniqueInstance
		                  boxFromString: code
		                  inputs: self inputs
		                  outputs: self outputs
		                  buffer: self errorBuffer.
		
	finalBox := self cutoff , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : #initialization }
Lowpass >> initialize [

	super initialize.
	self input: 0.
	self poles: 4.
	self cutoff: 2000
]
