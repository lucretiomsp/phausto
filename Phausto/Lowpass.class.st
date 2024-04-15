"
Nth-order Butterworth lowpass filter
A low-pass filter is a filter that passes signals with a frequency lower than a selected cutoff frequency and attenuates signals with frequencies higher than the cutoff frequency. The exact frequency response of the filter depends on the filter design.
@see https://en.wikipedia.org/wiki/Low-pass_filter
(https://ccrma.stanford.edu/~jos/filters/Butterworth_Lowpass_Design.html)
"
Class {
	#name : #Lowpass,
	#superclass : #ButterworthLPHP,
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #'as yet unclassified' }
Lowpass >> initialize [

	processExpression = 'process = fi.lowpass'.
	
]
